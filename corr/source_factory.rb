require_relative 'file_source'
require_relative 'http_source'

class SourceFactory
  def self.create(source)
    if source.start_with?('http://')
      HttpSource.new(source)
    elsif File.exist?(source)
      FileSource.new(source)
    end
  end
end
