# frozen_string_literal: true

module Nexmo
  class Client
    attr_writer :api_key
    attr_writer :api_secret
    attr_writer :signature_secret
    attr_writer :application_id
    attr_writer :private_key
    attr_writer :token
    attr_accessor :user_agent

    def initialize(options = {})
      @api_key = options[:api_key] || ENV['NEXMO_API_KEY']

      @api_secret = options[:api_secret] || ENV['NEXMO_API_SECRET']

      @signature_secret = options[:signature_secret] || ENV['NEXMO_SIGNATURE_SECRET']

      @application_id = options[:application_id]

      @private_key = options[:private_key]

      @token = nil

      @user_agent = UserAgent.string(options[:app_name], options[:app_version])

      self.http_options = options[:http]

      self.logger = options[:logger] || (defined?(Rails.logger) && Rails.logger)
    end

    attr_reader :http_options

    def http_options=(hash)
      @http_options = HTTP::Options.new(hash)
    end

    def logger
      @logger
    end

    def logger=(logger)
      @logger = Logger.new(logger)
    end

    def token
      @token || JWT.generate({application_id: application_id}, private_key)
    end

    def auth_token=(auth_token)
      Kernel.warn "#{self.class}##{__method__} is deprecated (use #token= instead)"

      @token = auth_token
    end

    def api_key
      unless @api_key
        raise AuthenticationError.new('No API key provided. ' \
          'See https://developer.nexmo.com/concepts/guides/authentication for details, ' \
          'or email support@nexmo.com if you have any questions.')
      end

      @api_key
    end

    def api_secret
      unless @api_secret
        raise AuthenticationError.new('No API secret provided. ' \
          'See https://developer.nexmo.com/concepts/guides/authentication for details, ' \
          'or email support@nexmo.com if you have any questions.')
      end

      @api_secret
    end

    def signature_secret
      unless @signature_secret
        raise AuthenticationError.new('No signature_secret provided. ' \
          'You can find your signature secret in the Nexmo dashboard. ' \
          'See https://developer.nexmo.com/concepts/guides/signing-messages for details, ' \
          'or email support@nexmo.com if you have any questions.')
      end

      @signature_secret
    end

    def application_id
      unless @application_id
        raise AuthenticationError.new('No application_id provided. ' \
          'Either provide an application_id, or set an auth token. ' \
          'You can add new applications from the Nexmo dashboard. ' \
          'See https://developer.nexmo.com/concepts/guides/applications for details, ' \
          'or email support@nexmo.com if you have any questions.')
      end

      @application_id
    end

    def private_key
      unless @private_key
        raise AuthenticationError.new('No private_key provided. ' \
          'Either provide a private_key, or set an auth token. ' \
          'You can add new applications from the Nexmo dashboard. ' \
          'See https://developer.nexmo.com/concepts/guides/applications for details, ' \
          'or email support@nexmo.com if you have any questions.')
      end

      @private_key
    end

    def signature
      @signature ||= Signature.new(self)
    end

    def account
      @account ||= Account.new(self)
    end

    def alerts
      @alerts ||= Alerts.new(self)
    end

    def applications
      @applications ||= Applications.new(self)
    end

    def calls
      @calls ||= Calls.new(self)
    end

    def conversions
      @conversions ||= Conversions.new(self)
    end

    def files
      @files ||= Files.new(self)
    end

    def messages
      @messages ||= Messages.new(self)
    end

    def number_insight
      @number_insight ||= NumberInsight.new(self)
    end

    def numbers
      @numbers ||= Numbers.new(self)
    end

    def pricing
      @pricing ||= PricingTypes.new(self)
    end

    def redact
      @redact ||= Redact.new(self)
    end

    def secrets
      @secrets ||= Secrets.new(self)
    end

    def sms
      @sms ||= SMS.new(self)
    end

    def verify
      @verify ||= Verify.new(self)
    end
  end
end
