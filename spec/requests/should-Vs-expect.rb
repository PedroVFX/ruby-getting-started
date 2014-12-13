require 'rails_helper'

RSpec.describe "Comparacao de leitura entre should e expect", :type => :helper do

  #SHOULD por opcao, porque tem uma leitura francamente melhor que o expect(page).to exemplo linha:24
  
  #Obrigatorio para o should
  subject { page }

  describe "Exemplos de escrita de ambos" do
    before { visit root_path } 

    it { should_not have_selector('title', text: 'Afonso Pais apresenta “Terra Concreta”') } 
    it { expect(page).not_to have_selector('title', text: 'Afonso Pais apresenta “Terra Concreta”') } 


    it { should have_title('') } 
    it { expect(page).to have_title('') } 


    it "... passa mas nao devia problema de sintax " do
      # PASSA mas nao devia, sintaxe errada. Falta page.to
      expect have_selector('title', text: 'AAfonso Pais apresenta “Terra ConTreta”')
      # NAO PASSA e aparentemente devia, mas a sintaxe esta errada. Falta page.to
      #expect to have_selector('div')
    end
  end
end
