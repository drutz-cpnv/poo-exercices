# frozen_string_literal: true

class MailServer

  def initialize(port, server, listener)
    @server = server.create(port, listener)
  end

  def start
    @server.start
  end

  def stop
    @server.stop
  end

end
