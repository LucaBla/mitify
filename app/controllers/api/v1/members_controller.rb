class Api::V1::MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      message: "You Are In!"
    }
  end

  private
  #def get_user_from_token
  #  jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
  #                  Rails.application.credentials.devise[:jwt_secret_key]).first
  #  user_id = jwt_payload['sub']
  #  user = User.find(user_id.to_s)
  #end
  
end