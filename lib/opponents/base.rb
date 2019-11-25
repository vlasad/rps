module Opponents
  class Base
    CHOICES = %w[rock paper scissors].freeze

    attr_accessor :error_msg

    def choice
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
