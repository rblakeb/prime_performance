class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show, :edit, :update, :delete]

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to @workout, notice: 'Workout was successfully published'
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to workout_path, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def destroy
    @workout = Workout.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to workouts_path, notice: 'Workout successfully deleted' }
      format.json { head :ok } 
      format.js
    end
  end

private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:sheduled_on, :publish_date, :content)
  end
end
