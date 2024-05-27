# frozen_string_literal: true

module Guard

  class MailGuard

    def initialize(policies = [])
      @policies = policies
    end

    def validate(mail)
      @policies.map { |policy| policy.check mail }.compact
    end

  end

end