module Opponents
  class Custom
    # attempts is a number of attempts to get valid choice from a single opponent
    def initialize(opponents, attempts=2)
      @attempts = attempts
      @opponents = opponents
      @opponents.each do |op|
        raise TypeError, "#{op.class} is not valid opponent" unless op.respond_to?(:choice)
      end
    end

    def choice
      @opponents.each do |op|
        @attempts.times do
          result = op.choice
          return result if op.error_msg.blank?
        end
      end
      ''
    end
  end
end
