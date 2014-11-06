class WelcomeController < ApplicationController

  # GET /welcome
  def index
	respond_to do |format| 
		format.js {render inline: "location = '#{root_url}';"} 
	end
  end

end
