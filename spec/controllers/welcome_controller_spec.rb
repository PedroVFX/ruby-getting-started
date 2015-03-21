require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  
  #context WelcomeController do

    before do 
      get :index
    end

    it "GET index is successful" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    describe @texto_lancamentos do
      it "assigns model TextoLancamento as @texto_lancamentos" do
        item = FactoryGirl.create(:texto_lancamento)
        expect(assigns[:texto_lancamentos][0]).to eq(item)
      end
    end

    describe @soundcloud_items do
      it "assigns model SoundcloudItem as @soundcloud_items" do
        item = FactoryGirl.create(:soundcloud_item)
        expect(assigns[:soundcloud_items][0]).to eq(item)
      end
    end

    describe @vimeo_items do
      it "assigns model VimeoItem as @vimeo_items" do
        item = FactoryGirl.create(:vimeo_item)
        expect(assigns[:vimeo_items][0]).to eq(item)
      end
    end

    describe @youtube_items do
      it "assigns model YoutubeItem as @youtube_items" do
        item = FactoryGirl.create(:youtube_item)
        expect(assigns[:youtube_items][0]).to eq(item)
      end
    end

end
