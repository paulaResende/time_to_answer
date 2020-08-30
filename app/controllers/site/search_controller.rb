class Site::SearchController < SiteController

  def questions
    @questions = Question.search(params)
  end

  def subject
    @questions = Question.search_subject(params[:page], params[:subject_id])
  end

end
