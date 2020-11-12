class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:home]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    @adverts = if params[:tag].present?
                 ::SearchService.new.call(params).tagged_with(params[:tag])
               else
                 ::SearchService.new.call(params)
               end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email
                                                         encrypted_password
                                                         login
                                                         full_name
                                                         birthday
                                                         address
                                                         city
                                                         state
                                                         country
                                                         zip
                                                         role])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[email
                                                                encrypted_password
                                                                login
                                                                full_name
                                                                birthday
                                                                address
                                                                city
                                                                state
                                                                country
                                                                zip
                                                                role])
  end
end
