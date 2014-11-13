require 'test_helper'

class VimeoItemsControllerTest < ActionController::TestCase
  setup do
    @vimeo_item = vimeo_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vimeo_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vimeo_item" do
    assert_difference('VimeoItem.count') do
      post :create, vimeo_item: { descricao: @vimeo_item.descricao, item: @vimeo_item.item, nome: @vimeo_item.nome }
    end

    assert_redirected_to vimeo_item_path(assigns(:vimeo_item))
  end

  test "should show vimeo_item" do
    get :show, id: @vimeo_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vimeo_item
    assert_response :success
  end

  test "should update vimeo_item" do
    patch :update, id: @vimeo_item, vimeo_item: { descricao: @vimeo_item.descricao, item: @vimeo_item.item, nome: @vimeo_item.nome }
    assert_redirected_to vimeo_item_path(assigns(:vimeo_item))
  end

  test "should destroy vimeo_item" do
    assert_difference('VimeoItem.count', -1) do
      delete :destroy, id: @vimeo_item
    end

    assert_redirected_to vimeo_items_path
  end
end
