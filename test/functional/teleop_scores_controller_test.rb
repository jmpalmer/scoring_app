require 'test_helper'

class TeleopScoresControllerTest < ActionController::TestCase
  setup do
    @teleop_score = teleop_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teleop_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teleop_score" do
    assert_difference('TeleopScore.count') do
      post :create, teleop_score: { alliance_id: @teleop_score.alliance_id, high: @teleop_score.high, low: @teleop_score.low, match_id: @teleop_score.match_id, medium: @teleop_score.medium, pyramid: @teleop_score.pyramid }
    end

    assert_redirected_to teleop_score_path(assigns(:teleop_score))
  end

  test "should show teleop_score" do
    get :show, id: @teleop_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teleop_score
    assert_response :success
  end

  test "should update teleop_score" do
    put :update, id: @teleop_score, teleop_score: { alliance_id: @teleop_score.alliance_id, high: @teleop_score.high, low: @teleop_score.low, match_id: @teleop_score.match_id, medium: @teleop_score.medium, pyramid: @teleop_score.pyramid }
    assert_redirected_to teleop_score_path(assigns(:teleop_score))
  end

  test "should destroy teleop_score" do
    assert_difference('TeleopScore.count', -1) do
      delete :destroy, id: @teleop_score
    end

    assert_redirected_to teleop_scores_path
  end
end
