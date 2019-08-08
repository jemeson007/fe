class PropertiesController < ApplicationController

	before_action :authenticate_human!, except: [:index, :show]
	
	def index 
		@properties = Property.all 
	end

	def show
		@property = Property.find(params[:id])
	end

	def new
		@property = current_human.properties.build
	end

	def edit
		@property = Property.find(params[:id])
	end

	def create
		@property = current_human.properties.build(property_params)

		if @property.save
			redirect_to @property

		else
			render 'new'
			
		end
	end

	def update
		@property = Property.find(params[:id])

		if @property.update(property_params)
			redirect_to @property
		else
			render 'edit'
		end
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy

		redirect_to properties_path
	end

	private

	def property_params
		params.require(:property).permit(:name, :place, :visual, :price, :spend, :accountNumber, multiView: [])
	end


end
