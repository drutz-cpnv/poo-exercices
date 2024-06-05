# frozen_string_literal: true

module Event

  class EmailReceivedEvent

    def initialize(mail)
      @mail = mail
    end

    def get_message
      "Received mail: #{@mail.from} #{@mail.to}"
    end

  end

  class EmailRejectedEvent

    def initialize(mail, reasons)
      @mail = mail
      @reasons = reasons
    end

    def get_message
      "Rejected mail: #{@mail.from} #{@mail.to}"
    end

  end

end