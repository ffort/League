require 'test_helper'

class ChampionControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
