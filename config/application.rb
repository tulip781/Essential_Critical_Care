require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EssentialCriticalCare
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.middleware.use Rack::Deflater
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :lo]
    config.i18n.fallbacks = [I18n.default_locale]
    config.time_zone = "London"
    config.active_record.default_timezone = :local
    config.assets.initialize_on_precompile = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
