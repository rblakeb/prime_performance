class ApplicationController < ActionController::Base

	# Devise redirects

	def store_current_location
  	store_location_for(:admin, request.url)
	end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  end

  def after_sign_up_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  end
end
