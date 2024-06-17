class FileSource
  attr_reader :students
  
  def initialize(path)
    @students = File.readlines(path).map {|line| line.chomp.split(' ') }
  end
end
