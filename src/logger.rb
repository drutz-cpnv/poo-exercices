# frozen_string_literal: true

module Logging
  class StdoutLogger
    def log(message)
      STDOUT.puts message
    end

    def error(message)
      STDERR.puts message
    end
  end

  class FileLogger

    def initialize(file)
      @file = file
    end

    def log(message)
      @file.open('a') do |f|
        f.puts message
      end
    end

    def error(message)
      log message
    end
  end
end