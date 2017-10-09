# Exposes the Teenager entity
class TeensController < ApplicationController
	
	def initialize 
		# this becomes accessbile by all the endpoints views (erb)
		@x = 6
	end

	def index
		@teens = Teen.all
	end

	def show
		@teen = Teen.find(params[:id])
	end

	def new
		@teen = Teen.new
	end

	def create
		@teen = Teen.new(teen_params)
		
		result = @teen.save
		if result 
			redirect_to teens_path
		else
			render 'new'
		end
	end	

	private
	# The params that a teen could have. Excludes all other attributes
	def teen_params
    	params.require(:teen).permit(:fname, :lname)
  	end
end
