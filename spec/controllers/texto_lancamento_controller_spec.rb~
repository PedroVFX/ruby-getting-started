require 'rails_helper'

RSpec.describe TextoLancamentosController, :type => :controller do

  include SessionsHelper

  user = FactoryGirl.create(:user)
  tl = FactoryGirl.create(:texto_lancamento)
  10.times {FactoryGirl.create(:texto_lancamento)}

  describe "whith signin", :type => :controller do
    before do 
      sign_in user	
    end

    describe "get :index" do
      before do 
        get :index
      end
      describe "should assign all to @texto_lancamentos order by updated_at DESC" do
        #it { allow(subject).to receive(:current_user).and_return }
        it { expect(assigns(:texto_lancamentos)).to be_a(ActiveRecord::Relation) }
        it { expect(assigns(:texto_lancamentos)).to_not be_an_instance_of TextoLancamento }
        it { expect(assigns[:texto_lancamentos]).to respond_to(:include) }
        it { expect(assigns[:texto_lancamentos]).to include(tl) }
        # it { expect(:texto_lancamentos).to include(tl) }  not respond to `include?`
        it { expect(assigns[:texto_lancamentos]).to eq(TextoLancamento.all.order('updated_at DESC')) }
        it { expect(response).to render_template(:index) }
        it { expect(:texto_lancamentos).to render_template(:index) }
        it { expect(subject).to render_template(:index) }
      end
    end

    describe "post :create" do

      it "should increment the TextoLancamento count" do
        expect do
          post :create, texto_lancamento: { nome: "1texto" }
        end.to change(TextoLancamento, :count).by(1)
      end
      it "should redirect to item" do
        post :create, texto_lancamento: { nome: "2texto" }
        is_expected.to_not respond_to(:include)
        # BUG Não passa: expect{subject}.to change{TextoLancamento.count}.by(1)
        expect(assigns(:texto_lancamento)).to be_an_instance_of TextoLancamento
        expect(assigns[:texto_lancamento]).to_not respond_to(:include)
        expect(assigns[:texto_lancamento]).to eq(TextoLancamento.find_by_nome("2texto"))
        expect(response).to redirect_to(TextoLancamento.find_by_nome("2texto"))
        expect(response).to_not redirect_to(tl)
        expect(flash[:notice]).to include("created")
      end
    end

    describe "delete :destroy" do
      it "should decrement the TextoLancamento count" do
        expect do
          delete :destroy, id: tl.id
        end.to change(TextoLancamento, :count).by(-1)
      end
      it "should redirect to index" do
        delete :destroy, id: tl.id
        expect(response).to redirect_to(texto_lancamentos_path)
        expect(flash[:notice]).to include("destroyed")
      end
    end

    describe "put :update" do
      it "should update and redirect to item show" do
        put :update, { id: tl.id, :texto_lancamento => {:nome => 'toto', :descricao => 'dsfsfsfsfdf'} } 
        expect(response).to redirect_to(TextoLancamento.find_by_nome("toto"))
        expect(flash[:notice]).to include("updated")
      end
    end
  end

  describe "whith NO signin", :type => :controller do
    describe "get :index" do
      before { get :index }
      it "should redirect to sign in page" do
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "get :show" do
      it "should redirect to sign in page" do
        get :show, id: tl.id
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "get :new" do
      it "should redirect to sign in page" do
        get :new
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "get :edit" do
      it "should redirect to sign in page" do
        get :edit, id: tl.id
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "put :update" do
      it "should redirect to sign in page" do
        put :update, { id: tl.id, :texto_lancamento => {:nome => 'toto', :descricao => 'dsfsfsfsfdf'} } 
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "post :create" do
      before { post :create, texto_lancamento: { nome: "2texto" }}
      it "should redirect to sign in page" do
        expect(response).to redirect_to(signin_path)
      end
    end
    describe "delete :destroy" do
      it "should redirect to sign in page" do
        delete :destroy, id: tl.id
        expect(response).to redirect_to(signin_path)
      end
    end
  end
end

