require 'test_helper'

class TenLinesControllerTest < ActionController::TestCase
  setup do
    @ten_line = ten_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ten_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ten_line" do
    assert_difference('TenLine.count') do
      post :create, ten_line: { name: @ten_line.name }
    end

    assert_redirected_to ten_line_path(assigns(:ten_line))
  end

  test "should show ten_line" do
    get :show, id: @ten_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ten_line
    assert_response :success
  end

  test "should update ten_line" do
    put :update, id: @ten_line, ten_line: { name: @ten_line.name }
    assert_redirected_to ten_line_path(assigns(:ten_line))
  end

  test "should destroy ten_line" do
    assert_difference('TenLine.count', -1) do
      delete :destroy, id: @ten_line
    end

    assert_redirected_to ten_lines_path
  end
end
