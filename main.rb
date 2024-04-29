# frozen_string_literal: true
require_relative 'queue'
require 'benchmark'

def fill_enqueue(queue, count)
  (1..count).each { |i| queue.enqueue(i) }
end

def fill_dequeue(queue)
  (1..queue.size).each { |_i| queue.dequeue }
end

small_array_queue = Queue::ArrayQueue.new
small_list_queue = Queue::ListQueue.new

large_array_queue = Queue::ArrayQueue.new
large_list_queue = Queue::ListQueue.new

fill_enqueue(small_array_queue, 100)
fill_enqueue(small_list_queue, 100)
fill_enqueue(large_array_queue, 100_000)
fill_enqueue(large_list_queue, 100_000)

Benchmark.bm(20) do |x|
  x.report('SM ArrayQueue#enqueue') { fill_enqueue(small_array_queue, 500_000) }
  x.report('SM ListQueue#enqueue') { fill_enqueue(small_list_queue, 500_000) }
  x.report('LG ArrayQueue#enqueue') { fill_enqueue(large_array_queue, 500_000) }
  x.report('LG ListQueue#enqueue') { fill_enqueue(large_list_queue, 500_000) }

  x.report('SM ArrayQueue#dequeue') { fill_dequeue(small_array_queue) }
  x.report('SM ListQueue#dequeue') { fill_dequeue(small_list_queue) }
  x.report('LG ArrayQueue#dequeue') { fill_dequeue(large_array_queue) }
  x.report('LG ListQueue#dequeue') { fill_dequeue(large_list_queue) }
end





