class GameController < ApplicationController
  before_action :validate_params

  def index
    opponent = Opponents::Custom.new([
                                       Opponents::Curb.new,
                                       Opponents::Random.new
                                     ])
    @server_choice = opponent.choice
    @user_choice = params[:choice]
    @result = RPSGame.play(@user_choice, @server_choice)
  end

  private

  def validate_params
    render(plain: 'invalid choice', status: :bad_request) && (return false) unless Opponents::Base::CHOICES.include?(params[:choice])
  end
end
