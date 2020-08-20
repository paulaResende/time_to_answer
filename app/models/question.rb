class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  #Kaminari
  paginates_per 5

  def self.search(params)
    Question.includes(:answers)
            .page(params[:page])
            .where("lower(description) LIKE ?","%#{params[:term].downcase}%")
  end


end

