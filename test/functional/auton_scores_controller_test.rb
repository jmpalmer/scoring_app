require 'test_helper'

class AutonScoresControllerTest < ActionController::TestCase
  setup do
    @auton_score = auton_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auton_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auton_score" do
    assert_difference('AutonScore.count') do
      post :create, auton_score: { alliance_id: @auton_score.alliance_id, high: @auton_score.high, low: @auton_score.low, match_id: @auton_score.match_id, medium: @auton_score.medium, pyramid: @auton_score.pyramid }
    end

    assert_redirected_to auton_score_path(assigns(:auton_score))
  end

  test "should show auton_score" do
    get :show, id: @auton_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auton_score
    assert_response :success
  end

  test "should update auton_score" do
    put :update, id: @auton_score, auton_score: { alliance_id: @auton_score.alliance_id, high: @auton_score.high, low: @auton_score.low, match_id: @auton_score.match_id, medium: @auton_score.medium, pyramid: @auton_score.pyramid }
    assert_redirected_to auton_score_path(assigns(:auton_score))
  end

  test "should destroy auton_score" do
    assert_difference('AutonScore.count', -1) do
      delete :destroy, id: @auton_score
    end

    assert_redirected_to auton_scores_path
  end
end
