require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FileSupportMovingstories
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.remove_unused_tags = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += [ 'appviews.css', 'cssanimations.css', 'dashboards.css', 'data_tracks.css','forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css','projects.css', 'sessions.css','tables.css', 'uielements.css', 'widgets.css' ]
    config.assets.precompile += [ 'appviews.js', 'cssanimations.js','custom.js','dashboards.js','data_tracks.js','forms.js', 'gallery.js', 'graphs.js','inspinia.js' ,'mailbox.js', 'miscellaneous.js', 'pages.js', 'projects.js','tables.js', 'uielements.js', 'widgets.js', ]
    config.exceptions_app = self.routes
  end
end
