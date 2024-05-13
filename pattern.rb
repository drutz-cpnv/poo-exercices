#!/usr/bin/ruby
# frozen_string_literal: true


require_relative 'queue_factory'

q1 = QueueFactory.get_queue(ARGV[0])
q2 = QueueFactory.get_queue(ARGV[1])

q1.enqueue(42)
q2.enqueue(1337)

p q1