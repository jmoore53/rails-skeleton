Mailgun.configure do |config|
    config.api_key = Rails.application.credentials.email[:api_key]
end