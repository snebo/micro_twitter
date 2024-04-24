class ApplicationController < ActionController::Base
  # modifiying this to access/override devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end
end
