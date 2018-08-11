class CreateNutritionClients < ActiveRecord::Migration[5.2]
  def change
    create_table :nutrition_clients do |t|
      t.timestamps
    end
  end
end
