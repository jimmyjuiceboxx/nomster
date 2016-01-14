class PlacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

        #  -----INDEX-----------
        #  @var =  model name .all unless using .paginate 
        #  Has its own page
	def index
		@places = Place.paginate(page:params[:page], per_page: 3)
	end

		#  -----NEW-------------
		#  @var = model name . new
		#  Has its own page
		#  Has form 
	def new
		@place = Place.new
	end
		#  -----CREATE----------
		#  Submits data to database
		#  @var = model name . create unless using devise
		#  divise change to current_user.places.create(place_params)
	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

		#  -----SHOW------------
		#  Find the right place and include (params[:id])
	def show
		@place = Place.find(params[:id])
	end


		#  -----EDIT------------
		#  Find the right place and include (params[:id])
	def edit
		@place = Place.find(params[:id])
	end


		#  -----UPDATE----------
		#  Find the right place and include (params[:id])
		#  Update this record and save the changes the user specifies into our database.
		#  Redirect User to root
	def update
		@place = Place.find(params[:id])
		@place.update_attributes(place_params)
		redirect_to root_path
	end	


        # -----DESTROY---------
	    # Find the right place
	    # Destroy the place from our database
	    # Redirect User to root
	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private

        #-----PARAMS------------
        #  Require (file)  Permit (Rows)
        #  Sucks code from form and puts it in database
	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
