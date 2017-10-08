class TeensController < ApplicationController
	def show
		@teen = Teen.find(params[:id])
	end

	def new
	end

	def create
		@teen = Teen.new(teen_params)
		
		@teen.save
		redirect_to @teen
	end	

	private
	def teen_params
    	params.require(:teen).permit(:fname, :lname)
  	end
end
