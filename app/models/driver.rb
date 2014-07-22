class Driver < ActiveRecord::Base

	def driver_params
		params.require(:driver).permit(:fName, :lName, :active)	
	end

	private :driver_params


	def index
		drivers = Driver.all
		if active = params[:active]
			drivers = drivers.where(active: active)
		end
		respond_to do |format|
			format.json {render json: drivers, status: 200}
			format.xml {render xml: drivers, status: 200}
		end
	end

	def show
		driver = Driver.find_by_name(params[:id])
		render json: driver, status: 200
	end

	def create
		driver = Driver.new(driver_params)
		if driver.save
			#new driver created succesfully
			head 204, location: driver
		else
			#Client error, retuen error as json
			render json: driver.errors, status: 422
		end
	end

	def update
		driver = Driver.find(params[:id])
		if driver.update(driver_params)
			head 204, location: driver
		else
			#Client error, retuen error as json
			render json: driver.errors, status: 422
		end
	end

	def destroy
		#drivers shouldn't be deleted they should just be archived
	end
end
