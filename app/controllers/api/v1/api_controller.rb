module Api::V1
  class ApiController < ApplicationController
    include Pundit
    
    before_action :authenticate_token, :authenticate_and_sign_in
  
    def authenticate_token
      if request.headers["HTTP_API_TOKEN"] != Rails.application.secrets['api_token']
        render :json => {}, :status => :unauthorized
      end
    end
    
    def authenticate_and_sign_in
      auth_token = request.headers["HTTP_AUTH_TOKEN"]
      
      @current_user = User.find_by_authentication_token(auth_token) unless auth_token.blank?
      
      if @current_user.blank?
        render :json => {errors: {auth_token: 'invalid access'} }, :status => :unauthorized
      end
    end
  end
end