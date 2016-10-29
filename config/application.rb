require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MinioPaperclip
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

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Set default configuration here, if you wish to use different buckets/servers in 
    # different environments please set configuration in config/environments/ files
    # For more details please refer to 
    # https://github.com/thoughtbot/paperclip#defaults
    config.paperclip_defaults = {
      storage: :s3,
      s3_protocol: ':https',
      s3_permissions: 'private',
      s3_region: 'us-east-1',     
      s3_credentials: {
        bucket: 'testbucket',
        access_key_id: 'Q3AM3UQ867SPQQA43P2F',
        secret_access_key: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',
      },
      s3_host_name: 'play.minio.io:9000',    
      s3_options: {
        endpoint: "https://play.minio.io:9000", # for aws-sdk
        force_path_style: true # for aws-sdk (required for minio)
      },
      url: ':s3_path_url',
      path: "/:class/:id.:style.:extension"    
    }

  end
end
