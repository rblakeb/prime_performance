class SessionsController < ApplicationController

	def create
	# 	user = NutritionCoach.find_by(email: params[:email]) || NutritionClient.find_by(email: params[:email])
	# 	if user && user.authenticate(params[:password])
	# 		session[:user_id] = user.id
	# 		flash[:success] = "Logged In!"
	# 			redirect_back_or(current_user)
	# 	else
	# 		flash.now[:danger] = "Email and password did not match. Please try again."
	# 		render :new
	# 	end
	# end

	# def destroy
	# 	:user_id = NutritionCoach.find_by(id: params[:nutrition_coach_id]) || NutritionClient.find_by(id: params[:nutrition_client_id])
	# 	session[:user_id] = nil
	# 	flash[:notice] = "Logged out successfully"
	# 	redirect_to :back
	# end

end
