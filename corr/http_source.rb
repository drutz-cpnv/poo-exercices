require 'net/http'
class HttpSource
  attr_reader :students
  
  def initialize(uri)
    @students = Net::HTTP.get(URI(uri)).split("\n").map {|line| line.chomp.split(' ') }
  end
end
