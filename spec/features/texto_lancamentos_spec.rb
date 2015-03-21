require 'rails_helper'

feature TextoLancamento, :type => :feature do
  subject { page }

  describe "Features" do
    texto_lancamento = FactoryGirl.create(:texto_lancamento)
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      visit signin_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"

      visit texto_lancamentos_path #index
    end

    describe "Delete links" do

      it { should have_link('Delete', href: texto_lancamento_path(texto_lancamento.id)) }

      describe "click Delete texto lancamento" do
        before { click_link('Delete', href: texto_lancamento_path(texto_lancamento.id)) }

        it "should change TextoLancamento count by -1" do  
          expect { should change(TextoLancamento, :count).by(-1) }
        end
        it "should not have link Delete with previous href" do  
          expect { should_not have_link('Delete', href: texto_lancamento_path(texto_lancamento.id)) }
        end
      end
    end


    describe "Edit links" do

      it { should have_link('Edit', href: edit_texto_lancamento_path(texto_lancamento.id)) }

      describe "click Edit Texto lancamento" do
        before { click_link('Edit', href: edit_texto_lancamento_path(texto_lancamento.id)) }

        it { should have_content("Edit Texto Lancamento") }

        describe "click update" do
          before { click_button('Update Texto lancamento') }

          it "should not change TextoLancamento count" do  
            expect { should_not change(TextoLancamento, :count) }
          end

          it "should see message success" do  
            expect { should have_selector('div.alert.alert-success') }
          end
        end

      end
    end


    describe "New texto lancamento" do
      before do
        click_link "New"
        fill_in "Nome",         with: "Example"
        fill_in "Descricao",    with: "Example com com com"
        click_button "Create Texto lancamento"
      end

      it "should change TextoLancamento count by 1" do  
        expect { should change(TextoLancamento, :count).by(1) }
      end
    end



  end
end
