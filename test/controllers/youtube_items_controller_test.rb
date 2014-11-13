require 'test_helper'

class YoutubeItemsControllerTest < ActionController::TestCase
  setup do
    @youtube_item = youtube_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:youtube_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create youtube_item" do
    assert_difference('YoutubeItem.count') do
      post :create, youtube_item: { descricao: @youtube_item.descricao, item: @youtube_item.item, nome: @youtube_item.nome }
    end

    assert_redirected_to youtube_item_path(assigns(:youtube_item))
  end

  test "should show youtube_item" do
    get :show, id: @youtube_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @youtube_item
    assert_response :success
  end

  test "should update youtube_item" do
    patch :update, id: @youtube_item, youtube_item: { descricao: @youtube_item.descricao, item: @youtube_item.item, nome: @youtube_item.nome }
    assert_redirected_to youtube_item_path(assigns(:youtube_item))
  end

  test "should destroy youtube_item" do
    assert_difference('YoutubeItem.count', -1) do
      delete :destroy, id: @youtube_item
    end

    assert_redirected_to youtube_items_path
  end
end
