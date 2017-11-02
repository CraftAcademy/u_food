class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # protect_from_forgery with: :null_session
  skip_before_action  :verify_authenticity_token
  # binding.pry
  def create
    super
  end

  def update
    super
  end

  protected

  def render_create_success
    render 'success'
  end

  def render_create_error
    render 'error', status: 422
  end

  def render_update_success
    render 'success'
  end

  def render_update_error
    render 'error', status: 422
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
  #                                                      :first_name,
  #                                                      :last_name,
  #                                                      :nickname,
  #                                                      :image,
  #                                                      :date_of_birth,
  #                                                      :gender,
  #                                                      :city,
  #                                                      :description,
  #                                                      :interest_list])
  # end
  #
  # def account_update_params
  #   params.permit(:name,
  #                 :first_name,
  #                 :last_name,
  #                 :nickname,
  #                 :image,
  #                 :date_of_birth,
  #                 :gender,
  #                 :city,
  #                 :description,
  #                 :interest_list)
  # end
end