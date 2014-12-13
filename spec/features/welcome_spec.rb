require 'rails_helper'

RSpec.describe "Features for Welcome page", :type => :feature do # feature ou request

    subject { page }

    describe "Shows the Afonso Pais site" do
      before do 
        visit root_path
      end
      it { expect(page).to have_content('Afonso Pais') }
    end

    describe "Shows the items of texto_lancamento" do
      before do
	FactoryGirl.create(:texto_lancamento)
        visit root_path #'/'
      end
      it { expect(page).to have_content('Lorem') }
      it { expect(page).to have_content('toto') }
    end

    describe "Shows the items of soundcloud_items" do
      before do
	FactoryGirl.create(:soundcloud_item)
        visit root_path #'/'
      end
      it { expect(page).to have_content('soundcloud') }
      it { expect(page).to have_content('toto') }
    end

    describe "Shows the items of vimeo_items" do
      before do
	FactoryGirl.create(:vimeo_item)
        visit root_path #'/'
      end
      it { expect(page).to have_content('vimeo') }
      it { expect(page).to have_content('toto') }
    end

    describe "Shows the items of youtube_items" do
      before do
	FactoryGirl.create(:youtube_item)
        visit root_path #'/'
      end
      it { expect(page).to have_content('youtube') }
      it { expect(page).to have_content('toto') }
    end


    describe "If signed in user" do
      before do
	FactoryGirl.create(:user)
        visit signin_path #'/signin'
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'foobar'
        click_button 'Sign in'
      end
      it { expect(page).to have_content('Sign out') }
    end

    describe "Else" do
      before do
	FactoryGirl.create(:user)
        visit signin_path #'/signin'
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password_errada'
        click_button 'Sign in'
      end
      it { expect(page).to have_content('Sign in') }
    end

end
