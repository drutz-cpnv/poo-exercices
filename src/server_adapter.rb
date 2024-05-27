module ServerAdapter

  class RumbsterAdapter

    def initialize(server)
      @server = server
    end

    def start
      @server.start
      @server.join
    end

    def stop
      @server.stop
    end

    def self.create(port, listener)
      s = Rumbster.new port
      s.add_observer listener
      self.new s
    end

  end


end
