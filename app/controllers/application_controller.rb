class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def define_locale
     if params[:locale] == nil
       I18n.locale = 'fr'
     else
       I18n.locale = params[:locale]
     end
   end
end
