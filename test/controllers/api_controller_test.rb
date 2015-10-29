require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get todotasks" do
    get :todotasks
    assert_response :success
  end

  test "should get projecttasks" do
    get :projecttasks
    assert_response :success
  end

end
