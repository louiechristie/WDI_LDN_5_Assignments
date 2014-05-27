require 'test_helper'

class MytodosControllerTest < ActionController::TestCase
  setup do
    @mytodo = mytodos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mytodos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mytodo" do
    assert_difference('Mytodo.count') do
      post :create, mytodo: { name: @mytodo.name }
    end

    assert_redirected_to mytodo_path(assigns(:mytodo))
  end

  test "should show mytodo" do
    get :show, id: @mytodo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mytodo
    assert_response :success
  end

  test "should update mytodo" do
    put :update, id: @mytodo, mytodo: { name: @mytodo.name }
    assert_redirected_to mytodo_path(assigns(:mytodo))
  end

  test "should destroy mytodo" do
    assert_difference('Mytodo.count', -1) do
      delete :destroy, id: @mytodo
    end

    assert_redirected_to mytodos_path
  end
end
