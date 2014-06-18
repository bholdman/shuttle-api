class RoutesController < ApplicationController
	include ActionController::MimeResponds
	
	def route_params
		params.require(:route).permit(:name, :active)	
	end

	private :route_params


	def index
		routes = Route.all
		if active = params[:active]
			routes = routes.where(active: active)
		end
		respond_to do |format|
			format.json {render json: routes, status: 200}
			format.xml {render xml: routes, status: 200}
		end
	end

	def show
		route = Route.find_by_name(params[:id])
		render json: route, status: 200
	end

	def create
		route = Routes.new(route_params)
		if route.save
			render json: route, status: 201, location: route
		end
	end
end
