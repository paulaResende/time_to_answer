class Site::AnswerController < SiteController

  def question
    puts "Teste #{params[:answer]}"
  end

end
