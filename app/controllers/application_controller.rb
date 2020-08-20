class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    #condicional ternário utilizando metaprogramação
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
  end

  #if devise_controler
  # '{resource_class.to_s.downcase}_devise'
  # else 'application'
end

