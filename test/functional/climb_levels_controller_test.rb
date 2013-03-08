require 'test_helper'

class ClimbLevelsControllerTest < ActionController::TestCase
  setup do
    @climb_level = climb_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climb_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climb_level" do
    assert_difference('ClimbLevel.count') do
      post :create, climb_level: { height: @climb_level.height, match_id: @climb_level.match_id, team_id: @climb_level.team_id }
    end

    assert_redirected_to climb_level_path(assigns(:climb_level))
  end

  test "should show climb_level" do
    get :show, id: @climb_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climb_level
    assert_response :success
  end

  test "should update climb_level" do
    put :update, id: @climb_level, climb_level: { height: @climb_level.height, match_id: @climb_level.match_id, team_id: @climb_level.team_id }
    assert_redirected_to climb_level_path(assigns(:climb_level))
  end

  test "should destroy climb_level" do
    assert_difference('ClimbLevel.count', -1) do
      delete :destroy, id: @climb_level
    end

    assert_redirected_to climb_levels_path
  end
end
