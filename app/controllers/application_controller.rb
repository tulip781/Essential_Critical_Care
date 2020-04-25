class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :get_nav_categories
  before_action :lang_color

  def configure_permitted_parameters
    added_attrs = [:username, :password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def lang_color
    if I18n.locale == :en
      @english_button = "language-button-active"
      @lao_button = "language-button"
    else
      @english_button = "language-button"
      @lao_button = "language-button-active"
    end
  end

  private

  def get_nav_categories
    @navlinks = NavbarBaseFolder.includes({categories: [:translations]}, :translations).sort_by(&:updated_at).reverse
    @hidden_navlinks = SecretNavbarBaseFolder.includes({secret_categories: [:translations]}, :translations).sort_by(&:updated_at).reverse
  end

end
