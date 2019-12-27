class AdminMailer < Devise::Mailer
    helper :application
    include Devise::Controllers::UrlHelpers
    default template_path: 'devise/mailer'

    def confirmation_instructions(record, token, opts={})
        @password = opts[:password]
        super
    end
end
