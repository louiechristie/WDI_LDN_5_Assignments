require 'test_helper'

class ClassGamesControllerTest < ActionController::TestCase
  setup do
    @class_game = class_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_game" do
    assert_difference('ClassGame.count') do
      post :create, class_game: { description: @class_game.description, image: @class_game.image, name: @class_game.name }
    end

    assert_redirected_to class_game_path(assigns(:class_game))
  end

  test "should show class_game" do
    get :show, id: @class_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_game
    assert_response :success
  end

  test "should update class_game" do
    put :update, id: @class_game, class_game: { description: @class_game.description, image: @class_game.image, name: @class_game.name }
    assert_redirected_to class_game_path(assigns(:class_game))
  end

  test "should destroy class_game" do
    assert_difference('ClassGame.count', -1) do
      delete :destroy, id: @class_game
    end

    assert_redirected_to class_games_path
  end
end
