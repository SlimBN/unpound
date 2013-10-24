require 'test_helper'

class SoonsControllerTest < ActionController::TestCase
  setup do
    @soon = soons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soon" do
    assert_difference('Soon.count') do
      post :create, soon: { active: @soon.active, mail: @soon.mail }
    end

    assert_redirected_to soon_path(assigns(:soon))
  end

  test "should show soon" do
    get :show, id: @soon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soon
    assert_response :success
  end

  test "should update soon" do
    put :update, id: @soon, soon: { active: @soon.active, mail: @soon.mail }
    assert_redirected_to soon_path(assigns(:soon))
  end

  test "should destroy soon" do
    assert_difference('Soon.count', -1) do
      delete :destroy, id: @soon
    end

    assert_redirected_to soons_path
  end
end
