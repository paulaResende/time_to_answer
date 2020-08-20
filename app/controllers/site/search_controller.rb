class Site::SearchController < SiteController

  def questions
    # params[:terms]
    # @questions = Question.includes(:answers).page params[:page]
    @questions = Question.includes(:answers)
                         .page(params[:page])
                         .where("lower(description) LIKE ?",
                                "%#{params[:term].downcase}%")
  end
end
