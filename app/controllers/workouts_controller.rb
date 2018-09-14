class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show, :edit, :update, :delete]
  before_action :authenticate_admin!, only: [:new, :edit, :delete]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
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
    @workout = Workout.friendly.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to workouts_path, notice: 'Workout successfully deleted' }
      format.json { head :ok } 
      format.js
    end
  end

private

  def set_workout
    @workout = Workout.friendly.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:scheduled_on, :publish_date, :content)
  end
end
