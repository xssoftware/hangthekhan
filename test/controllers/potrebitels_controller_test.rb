require 'test_helper'

class PotrebitelsControllerTest < ActionController::TestCase
  setup do
    @potrebitel = potrebitels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potrebitels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potrebitel" do
    assert_difference('Potrebitel.count') do
      post :create, potrebitel: { email: @potrebitel.email, failure_cat_id: @potrebitel.failure_cat_id, login: @potrebitel.login, lost: @potrebitel.lost, password: @potrebitel.password, reiting_pos: @potrebitel.reiting_pos, success_cat_id: @potrebitel.success_cat_id, time_online: @potrebitel.time_online, win: @potrebitel.win }
    end

    assert_redirected_to potrebitel_path(assigns(:potrebitel))
  end

  test "should show potrebitel" do
    get :show, id: @potrebitel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potrebitel
    assert_response :success
  end

  test "should update potrebitel" do
    patch :update, id: @potrebitel, potrebitel: { email: @potrebitel.email, failure_cat_id: @potrebitel.failure_cat_id, login: @potrebitel.login, lost: @potrebitel.lost, password: @potrebitel.password, reiting_pos: @potrebitel.reiting_pos, success_cat_id: @potrebitel.success_cat_id, time_online: @potrebitel.time_online, win: @potrebitel.win }
    assert_redirected_to potrebitel_path(assigns(:potrebitel))
  end

  test "should destroy potrebitel" do
    assert_difference('Potrebitel.count', -1) do
      delete :destroy, id: @potrebitel
    end

    assert_redirected_to potrebitels_path
  end
end
