class RPSGame
  WINS = [
    'rock' + 'scissors',
    'scissors' + 'paper',
    'paper' + 'rock'
  ].freeze

  def self.play(a, b)
    return 'tied' if a == b
    return 'won' if WINS.include?(a + b)

    'lost'
  end
end
