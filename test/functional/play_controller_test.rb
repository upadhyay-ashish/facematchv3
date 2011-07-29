require 'test_helper'

class PlayControllerTest < ActionController::TestCase
  test "should get play_game" do
    get :play_game
    assert_response :success
  end

end
