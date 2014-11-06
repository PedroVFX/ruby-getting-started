class WelcomeController < ApplicationController

  # GET /welcome
  def index
	respond_to do |format| 
		format.js {render inline: "location.reload();" } 
	end
  end

end
