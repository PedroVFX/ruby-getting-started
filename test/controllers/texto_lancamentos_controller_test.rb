require 'test_helper'

class TextoLancamentosControllerTest < ActionController::TestCase
  setup do
    @texto_lancamento = texto_lancamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:texto_lancamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create texto_lancamento" do
    assert_difference('TextoLancamento.count') do
      post :create, texto_lancamento: { descricao: @texto_lancamento.descricao, nome: @texto_lancamento.nome }
    end

    assert_redirected_to texto_lancamento_path(assigns(:texto_lancamento))
  end

  test "should show texto_lancamento" do
    get :show, id: @texto_lancamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @texto_lancamento
    assert_response :success
  end

  test "should update texto_lancamento" do
    patch :update, id: @texto_lancamento, texto_lancamento: { descricao: @texto_lancamento.descricao, nome: @texto_lancamento.nome }
    assert_redirected_to texto_lancamento_path(assigns(:texto_lancamento))
  end

  test "should destroy texto_lancamento" do
    assert_difference('TextoLancamento.count', -1) do
      delete :destroy, id: @texto_lancamento
    end

    assert_redirected_to texto_lancamentos_path
  end
end
