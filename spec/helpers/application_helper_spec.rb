require 'rails_helper'

RSpec.describe "AplicationHelper", :type => :helper do

  describe "full_title" do

    it "should include the page title" do
      expect(helper.full_title("Afonso")).to match(/Afonso/)
    end

    it "should include the base title" do
      expect(helper.full_title("xpto")).to match(/^Afonso Pais apresenta "Terra Concreta"/)
    end

    it "should not include a bar for the home page" do
      expect(helper.full_title("")).not_to match(/\|/)
    end
  end

end
