require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test 'should get bad request' do
    get root_url
    assert_response :bad_request
  end

  test 'should get success' do
    get root_url(choice: 'rock')
    assert_response :success
  end
end
