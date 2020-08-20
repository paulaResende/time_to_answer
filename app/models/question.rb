class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  #Kaminari
  paginates_per 5

  #Scopes devem ser utilizados com pesquisas, queries no banco de dados
  scope :search, -> (params) {
    includes(:answers)
        .page(params[:page])
        .where("lower(description) LIKE ?","%#{params[:term].downcase}%")
  }

  scope :last_questions, -> (params) {
    includes(:answers)
        .order('created_at desc')
        .page params[:page]
  }

end

