require 'test_helper'

class RPSGameTest < ActionDispatch::IntegrationTest
  test 'should return tied' do
    assert_equal 'tied', RPSGame.play('rock', 'rock')
    assert_equal 'tied', RPSGame.play('scissors', 'scissors')
    assert_equal 'tied', RPSGame.play('paper', 'paper')
  end

  test 'should return won' do
    assert_equal 'won', RPSGame.play('rock', 'scissors')
    assert_equal 'won', RPSGame.play('scissors', 'paper')
    assert_equal 'won', RPSGame.play('paper', 'rock')
  end

  test 'should return lost' do
    assert_equal 'lost', RPSGame.play('rock', 'paper')
    assert_equal 'lost', RPSGame.play('scissors', 'rock')
    assert_equal 'lost', RPSGame.play('paper', 'scissors')
  end
end
