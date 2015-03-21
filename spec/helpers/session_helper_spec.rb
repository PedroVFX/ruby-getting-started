require 'rails_helper'

RSpec.describe SessionsHelper, :type => :helper do

  describe "Authenticate helper" do
    user = FactoryGirl.create(:user)
    before do 
      helper.sign_in user
    end

    describe "user session after sign_in function" do

      it "should have current_user" do 
         expect(helper.current_user).not_to be_nil
         expect(helper.current_user).to eq(user)
      end

      it "current_user is not an array" do 
         expect(helper.current_user).not_to respond_to(:include)
      end

      it "user should have remember_token" do 
        expect(user.remember_token).not_to be_nil 
      end

      it "user should have cookie with remember_token" do  
        expect(User.digest(cookies[:remember_token])).to eq(user.remember_token)
      end

      it "should find user via cookie" do
        expect(User.find_by(remember_token: 
               User.digest(cookies[:remember_token]))).to eq(helper.current_user) 
      end

      it "should not redirect to signin" do
        expect(helper.signed_in?).to eq(true)
        expect(helper.signed_in_user).to eq(nil)
      end

      it "should store_location 'http://test.host' " do
        expect(helper.store_location).to eq(helper.request.url)
      end

    end

    describe "user remember_token after sign_out function" do
      before { helper.sign_out }
      specify { expect(cookies[:remember_token]).to be_nil }
    end

  end
end
