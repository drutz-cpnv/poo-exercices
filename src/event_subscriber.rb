# frozen_string_literal: true
require_relative 'event'

module Event

  class MailEventSubscriber

    def initialize(logger)
      @logger = logger
    end

    def self.subscribed_events
      {
        Event::EmailReceivedEvent => "on_received",
        Event::EmailRejectedEvent => "on_rejected",
      }
    end

    def on_received(event)
      @logger.log event.get_message
    end

    def on_rejected(event)
      @logger.log event.get_message
    end

  end

end

