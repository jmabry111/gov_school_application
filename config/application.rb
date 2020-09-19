require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovSchoolApplication
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
#    config.encoding = "utf-8"
#    config.filter_parameters += [:password]
#    config.active_support.escape_html_entities_in_json = true
#    config.assets.enabled = true
#    config.assets.compile = true
#    config.assets.precompile += %w[active_admin.css active_admin.js]
#    config.assets.version = '1.0'
#    config.assets.initialize_on_precompile = false
    # Configure email options
    config.action_mailer.smtp_settings = {
      :address                => "smtp.gmail.com",
      :port                   => 587,
      :domain                 => "pgsmst.com",
      :user_name              => "application@pgsmst.com",
      :password               => "NewStudent",
      :authentication         => :plain,
      :enable_starttls_auto   => true,
    }
    config.action_mailer.default_url_options = {
      :host => "pgsmst.com"
    }
  end
end
