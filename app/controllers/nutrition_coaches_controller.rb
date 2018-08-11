class NutritionCoachesController < ApplicationController
  before_action :set_nutrition_coach, only: [:show, :edit, :update, :destroy]

  def index
    @nutrition_coaches = NutritionCoach.all
  end

  def show
    # @nutrition_coach = @nutrition_coach.nutrition_clients.all
  end

  def new
    @nutrition_coach = NutritionCoach.new
  end

  def edit
  end

  def create
    @nutrition_coach = NutritionCoach.new(nutrition_coach_params)

    respond_to do |format|
      if @nutrition_coach.save
        format.html { redirect_to @nutrition_coach, notice: 'Nutrition coach was successfully created.' }
        format.json { render :show, status: :created, location: @nutrition_coach }
      else
        format.html { render :new }
        format.json { render json: @nutrition_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @nutrition_coach.update(nutrition_coach_params)
        format.html { redirect_to @nutrition_coach, notice: 'Nutrition coach was successfully updated.' }
        format.json { render :show, status: :ok, location: @nutrition_coach }
      else
        format.html { render :edit }
        format.json { render json: @nutrition_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nutrition_coach.destroy
    respond_to do |format|
      format.html { redirect_to nutrition_coaches_url, notice: 'Nutrition coach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_nutrition_coach
      @nutrition_coach = NutritionCoach.find(params[:id])
    end


    def nutrition_coach_params
      params.require(:nutrition_coach).permit(:email, :name, :password)
    end
end
