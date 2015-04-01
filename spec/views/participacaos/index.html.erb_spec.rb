require 'rails_helper'

RSpec.describe "participacaos/index", :type => :view do
  before(:each) do
    assign(:participacaos, [
      Participacao.create!(
        :dialog => "Dialog",
        :titulo => "Titulo",
        :imagem => "Imagem",
        :texto => "MyText",
        :nota => "MyText"
      ),
      Participacao.create!(
        :dialog => "Dialog",
        :titulo => "Titulo",
        :imagem => "Imagem",
        :texto => "MyText",
        :nota => "MyText"
      )
    ])
  end

  it "renders a list of participacaos" do
    render
    assert_select "tr>td", :text => "Dialog".to_s, :count => 2
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "Imagem".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
