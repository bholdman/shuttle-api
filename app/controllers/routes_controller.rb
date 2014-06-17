class RoutesController < ApplicationController
	include ActionController::MimeResponds
	
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
end
