require 'rails_helper'

RSpec.describe "Participacaos", :type => :request do
  describe "GET /participacaos" do
    it "works! (now write some real specs)" do
      get participacaos_path
      expect(response.status).to be(200)
    end
  end
end
