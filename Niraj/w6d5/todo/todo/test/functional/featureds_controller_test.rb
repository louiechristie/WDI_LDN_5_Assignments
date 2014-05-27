require 'test_helper'

class FeaturedsControllerTest < ActionController::TestCase
  setup do
    @featured = featureds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featureds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create featured" do
    assert_difference('Featured.count') do
      post :create, featured: {  }
    end

    assert_redirected_to featured_path(assigns(:featured))
  end

  test "should show featured" do
    get :show, id: @featured
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @featured
    assert_response :success
  end

  test "should update featured" do
    put :update, id: @featured, featured: {  }
    assert_redirected_to featured_path(assigns(:featured))
  end

  test "should destroy featured" do
    assert_difference('Featured.count', -1) do
      delete :destroy, id: @featured
    end

    assert_redirected_to featureds_path
  end
end
