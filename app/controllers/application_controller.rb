class ApplicationController < ActionController::Base

  def current_page?
    current_page?(path)
  end

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

  def authenticate_admin!
    unless current_admin
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Sorry, you can't do that"
    end
  end
  
end
