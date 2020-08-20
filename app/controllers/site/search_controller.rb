class Site::SearchController < SiteController

  def questions
    @questions = Question.search(params)
  end

end
