# frozen_string_literal: true

module Policy

  class Policy

    def initialize(config = {})
      raise MisconfiguredPolicyError.new message: "Configuration of #{self.class} must include #{@mandatory_config.join(', ')}" unless @mandatory_config.map { |el| config.keys.include?(el) ? nil : el }.compact.empty?
      @config = config
    end

  end

  class BadWordPolicy < Policy

    def initialize(config = nil)
      @mandatory_config = ["word_list"]
      super(config)
      @bad_words_regex = Regexp.new(@config["word_list"].join('|'))
    end

    def check(mail)
      !mail.body.match(@bad_words_regex) ? nil : PolicyViolation.new(self, mail);
    end
  end

  class RecipientPolicy < Policy

    def initialize(config = {})
      @mandatory_config = ["regex"]
      super(config)
      @regex = Regexp.new(config['regex'])
    end

    def check(mail)
      !mail.destinations.none? { |destination| @regex.match(destination) }  ? nil : PolicyViolation.new(self, mail);
    end

  end

  class SenderPolicy < Policy

    def initialize(config = {})
      @mandatory_config = ["regex"]
      super(config)
      @regex = Regexp.new(config['regex'])
    end

    def check(mail)
      mail.from.none? { |sender| @regex.match(sender) } ? nil : PolicyViolation.new(self, mail);
    end

  end

  class MisconfiguredPolicyError < StandardError
  end

  class PolicyViolation
    def initialize(policy, mail)
      @policy = policy
      @mail = mail
    end
  end

end
