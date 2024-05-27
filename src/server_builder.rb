require 'rumbster'

module ServerBuilder

  class RumbsterServerBuilder

    def self.create_server(port, listener)
      s = Rumbster.new port
      s.add_observer listener
    end

  end

end
