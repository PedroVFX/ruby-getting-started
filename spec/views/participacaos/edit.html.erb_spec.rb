require 'rails_helper'

RSpec.describe "participacaos/edit", :type => :view do
  before(:each) do
    @participacao = assign(:participacao, Participacao.create!(
      :dialog => "MyString",
      :titulo => "MyString",
      :imagem => "MyString",
      :texto => "MyText",
      :nota => "MyText"
    ))
  end

  it "renders the edit participacao form" do
    render

    assert_select "form[action=?][method=?]", participacao_path(@participacao), "post" do

      assert_select "input#participacao_dialog[name=?]", "participacao[dialog]"

      assert_select "input#participacao_titulo[name=?]", "participacao[titulo]"

      assert_select "input#participacao_imagem[name=?]", "participacao[imagem]"

      assert_select "textarea#participacao_texto[name=?]", "participacao[texto]"

      assert_select "textarea#participacao_nota[name=?]", "participacao[nota]"
    end
  end
end
