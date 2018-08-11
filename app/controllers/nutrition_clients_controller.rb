class NutritionClientsController < ApplicationController
  before_action :set_nutrition_client, only: [:show, :edit, :update, :destroy]
  before_action :set_nutrition_coach, only: [:show]

  def index
    @nutrition_clients = NutritionClient.all
  end

  def show
    
  end

  def new
    @nutrition_client = NutritionClient.new
  end

  def edit
  end

  def create
    @nutrition_client = NutritionClient.new(nutrition_client_params)

    respond_to do |format|
      if @nutrition_client.save
        format.html { redirect_to @nutrition_client, notice: 'Nutrition client was successfully created.' }
        format.json { render :show, status: :created, location: @nutrition_client }
      else
        format.html { render :new }
        format.json { render json: @nutrition_client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @nutrition_client.update(nutrition_client_params)
        format.html { redirect_to @nutrition_client, notice: 'Nutrition client was successfully updated.' }
        format.json { render :show, status: :ok, location: @nutrition_client }
      else
        format.html { render :edit }
        format.json { render json: @nutrition_client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nutrition_client.destroy
    respond_to do |format|
      format.html { redirect_to nutrition_clients_url, notice: 'Nutrition client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_nutrition_client
      @nutrition_client = NutritionClient.find(params[:id])
    end

    def set_nutrition_coach
      @nutrition_coach = NutritionCoach.find(params[:nutrition_coach_id])
    end


    def nutrition_client_params
      params.require(:nutrition_client).permit(:email, :name, :protein, :fat, :carbs, :start_date, :active, :password, :bodyweight, :nutrition_coach_id)
    end
end
