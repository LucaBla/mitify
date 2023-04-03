# This controller handles user sessions using the Devise gem.
# It inherits from Devise::SessionsController.
class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  # Called after a MitifyUser successfully signs in.
  # Returns a JSON response with the user and his role.
  def respond_with(resource, _opts = {})
    render json: {
      message: 'Logged in.',
      user: current_mitify_user,
      role: current_mitify_user.role
    }, status: :ok
  end

  # Called after a MitifyUser successfully signs out.
  # Checks if there is a current_user and logs them out.
  def resond_to_on_destroy
    log_out_success && return if current_mitify_user

    log_out_failure
  end

   # Called by `resond_to_on_destroy` after a MitifyUser successfully logs out.
  # Returns a JSON response with a message
  def log_out_success
    render json: {message: 'Logged out.'}, status: :ok
  end

   # Called by `resond_to_on_destroy` after a MitifyUser fails to log out.
   # Returns a JSON response with a message
   # Returns the status unauthorized
  def log_out_failure
    render json: {message: 'Failed to Logged out.'}, status: :unauthorized
  end

end