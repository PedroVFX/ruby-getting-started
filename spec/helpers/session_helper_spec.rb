require 'rails_helper'

RSpec.describe SessionsHelper, :type => :helper do

  describe "Authenticate helper" do

    before do 
      @user = FactoryGirl.create(:user)
      helper.sign_in @user
    end

    describe "user session after sign_in function" do

      it "should have remember_token" do 
        expect(@user.remember_token).not_to be_nil 
      end

      it "should have cookie with remember_token" do  
        expect(User.digest(cookies[:remember_token])).to eq(@user.remember_token)
      end

      it "should find user via cookie" do
        expect(User.find_by(remember_token: 
               User.digest(cookies[:remember_token]))).to eq(current_user) 
      end
    end

    describe "user cookie after sign_out function" do
      before { helper.sign_out }
      specify { expect(cookies[:remember_token]).to be_nil }
    end

  end
end
