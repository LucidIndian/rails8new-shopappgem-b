class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # This ensures that CSRF protection is only disabled for the 
  # Shopify session routes while keeping it enabled for the rest of your app.
  protect_from_forgery with: :exception

  # Disable CSRF for Shopify session routes
  skip_before_action :verify_authenticity_token, if: :shopify_controller?

  private

  def shopify_controller?
    params[:controller].start_with?("shopify_app/sessions")
  end

end
