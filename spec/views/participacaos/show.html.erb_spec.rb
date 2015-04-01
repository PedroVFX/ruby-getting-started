require 'rails_helper'

RSpec.describe "participacaos/show", :type => :view do
  before(:each) do
    @participacao = assign(:participacao, Participacao.create!(
      :dialog => "Dialog",
      :titulo => "Titulo",
      :imagem => "Imagem",
      :texto => "MyText",
      :nota => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dialog/)
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/Imagem/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
