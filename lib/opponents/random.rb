module Opponents
  class Random < Opponents::Base
    def choice
      CHOICES.sample
    end
  end
end
