require 'test_helper'

class MiscAssetsControllerTest < ActionController::TestCase
  setup do
    @misc_asset = misc_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:misc_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create misc_asset" do
    assert_difference('MiscAsset.count') do
      post :create, misc_asset: {  }
    end

    assert_redirected_to misc_asset_path(assigns(:misc_asset))
  end

  test "should show misc_asset" do
    get :show, id: @misc_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @misc_asset
    assert_response :success
  end

  test "should update misc_asset" do
    patch :update, id: @misc_asset, misc_asset: {  }
    assert_redirected_to misc_asset_path(assigns(:misc_asset))
  end

  test "should destroy misc_asset" do
    assert_difference('MiscAsset.count', -1) do
      delete :destroy, id: @misc_asset
    end

    assert_redirected_to misc_assets_path
  end
end
