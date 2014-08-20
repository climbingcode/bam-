require 'test_helper'

class FontsControllerTest < ActionController::TestCase
  setup do
    @font = fonts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fonts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create font" do
    assert_difference('Font.count') do
      post :create, font: {  }
    end

    assert_redirected_to font_path(assigns(:font))
  end

  test "should show font" do
    get :show, id: @font
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @font
    assert_response :success
  end

  test "should update font" do
    patch :update, id: @font, font: {  }
    assert_redirected_to font_path(assigns(:font))
  end

  test "should destroy font" do
    assert_difference('Font.count', -1) do
      delete :destroy, id: @font
    end

    assert_redirected_to fonts_path
  end
end
