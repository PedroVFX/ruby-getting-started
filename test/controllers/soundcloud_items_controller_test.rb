require 'test_helper'

class SoundcloudItemsControllerTest < ActionController::TestCase
  setup do
    @soundcloud_item = soundcloud_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soundcloud_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soundcloud_item" do
    assert_difference('SoundcloudItem.count') do
      post :create, soundcloud_item: { descricao: @soundcloud_item.descricao, item: @soundcloud_item.item, nome: @soundcloud_item.nome }
    end

    assert_redirected_to soundcloud_item_path(assigns(:soundcloud_item))
  end

  test "should show soundcloud_item" do
    get :show, id: @soundcloud_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soundcloud_item
    assert_response :success
  end

  test "should update soundcloud_item" do
    patch :update, id: @soundcloud_item, soundcloud_item: { descricao: @soundcloud_item.descricao, item: @soundcloud_item.item, nome: @soundcloud_item.nome }
    assert_redirected_to soundcloud_item_path(assigns(:soundcloud_item))
  end

  test "should destroy soundcloud_item" do
    assert_difference('SoundcloudItem.count', -1) do
      delete :destroy, id: @soundcloud_item
    end

    assert_redirected_to soundcloud_items_path
  end
end
