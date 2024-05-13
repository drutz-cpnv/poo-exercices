# frozen_string_literal: true
require_relative 'queue'

class QueueFactory

  @queue_types = {
    "optimized_for_memory" => Queue::ArrayQueue,
    "optimized_for_speed" => Queue::ListQueue,
  }

  def self.get_queue(queue_type)
    @queue_types[queue_type].new
  end

end
