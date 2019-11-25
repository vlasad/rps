module Opponents
  class Base
    CHOICES = %w[rock paper scissors].freeze

    attr_accessor :errorMsg

    def choice
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
