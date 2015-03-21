require 'rails_helper'

feature SessionsHelper, :type => :feature do


  describe "Authorization" do
    before { visit signin_path }
    subject { page }

    describe "signin page" do
      it { should have_content('Sign in') }
      it { should have_title('Sign in') }
    end

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_error_message('Invalid email/password combination') }

      describe "after visiting another page" do
        before { click_link "About" }
        it { should_not have_selector('div.alert.alert-error') }
      end

      describe "visiting users the edit page" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit edit_user_path(user) }
        it { should have_title('Sign in') }
      end
      describe "visiting texto_lancamento edit page" do
        let(:texto_lancamento) { FactoryGirl.create(:texto_lancamento) }
        before { visit edit_texto_lancamento_path(texto_lancamento) }
        it { should have_title('Sign in') }
      end
      describe "visiting vimeo_item edit page" do
        let(:vimeo_item) { FactoryGirl.create(:vimeo_item) }
        before { visit edit_vimeo_item_path(vimeo_item) }
        it { should have_title('Sign in') }
      end
      describe "visiting youtube_item edit page" do
        let(:youtube_item) { FactoryGirl.create(:youtube_item) }
        before { visit edit_youtube_item_path(youtube_item) }
        it { should have_title('Sign in') }
      end
      describe "visiting soundcloud_item edit page" do
        let(:soundcloud_item) { FactoryGirl.create(:soundcloud_item) }
        before { visit edit_soundcloud_item_path(soundcloud_item) }
        it { should have_title('Sign in') }
      end

    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      describe "visiting texto_lancamento the edit page" do
        let(:texto_lancamento) { FactoryGirl.create(:texto_lancamento) }
        before { visit edit_texto_lancamento_path(texto_lancamento) }
        it { should have_content('Sign out') }
      end
      describe "visiting vimeo_item edit page" do
        let(:vimeo_item) { FactoryGirl.create(:vimeo_item) }
        before { visit edit_vimeo_item_path(vimeo_item) }
        it { should have_content('Sign out') }
      end
      describe "visiting youtube_item edit page" do
        let(:youtube_item) { FactoryGirl.create(:youtube_item) }
        before { visit edit_youtube_item_path(youtube_item) }
        it { should have_content('Sign out') }
      end
      describe "visiting soundcloud_item edit page" do
        let(:soundcloud_item) { FactoryGirl.create(:soundcloud_item) }
        before { visit edit_soundcloud_item_path(soundcloud_item) }
        it { should have_content('Sign out') }
      end

      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
