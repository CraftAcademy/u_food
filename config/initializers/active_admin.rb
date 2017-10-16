ActiveAdmin.setup do |config|
  
  config.site_title = "U Food"

  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.comments = false

  config.batch_actions = true

  config.localize_format = :long

  config.authorization_adapter = ActiveAdmin::CanCanAdapter

  ActiveAdmin::ResourceController.class_eval do
    protected

    def current_ability
      @current_ability ||= AdminAbility.new(current_admin_user)
    end
  end
end
