class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'Logged in.',
      user: current_mitify_user,
      role: current_mitify_user.role
    }, status: :ok
  end

  def resond_to_on_destroy
    log_out_success && return if current_mitify_user

    log_out_failure
  end

  def log_out_success
    render json: {message: 'Logged out.'}, status: :ok
  end

  def log_out_failure
    render json: {message: 'Failed to Logged out.'}, status: :unauthorized
  end

end