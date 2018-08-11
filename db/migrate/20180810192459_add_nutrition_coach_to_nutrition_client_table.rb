class AddNutritionCoachToNutritionClientTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :nutrition_clients, :nutrition_coach_id, :integer
  end
end
