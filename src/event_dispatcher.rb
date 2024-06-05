# frozen_string_literal: true

module Event

  class EventDispatcher

    def initialize(subscribers)
      @subscribers = subscribers
      @events = {}

      @subscribers.each do |subscriber|
        subscriber.class.subscribed_events.each do |event, method|
          @events[event] = [subscriber, method]
        end
      end
    end

    def dispatch(event)
      e = @events[event.class]
      e[0].public_send(e[1], event)
    end

  end

end
