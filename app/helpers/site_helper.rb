module SiteHelper

  def msg_jumbotron
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas..."
    when 'questions'
      "Resultados para o termo \"#{params[:term]}\"... "
    when 'subject'
      "Filtradas por assunto \"#{params[:subject_id]}\"..."
    end
  end
end
