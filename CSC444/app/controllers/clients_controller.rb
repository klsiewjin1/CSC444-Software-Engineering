class ClientsController < ApplicationController
	def new
	end

	def show
		@client = Client.find(params[:id])
	end

	def index
		@clients= Client.all
	end
	def create
		@client = Client.new(client_params)

		result = @client.save
		if result
			redirect_to @client
		else 
			render 'new'
		end
	end

	private
	# The params that a teen could have. Excludes all other attributes
	def client_params
    	params.require(:client).permit(:fname, :lname)
  	end

end
