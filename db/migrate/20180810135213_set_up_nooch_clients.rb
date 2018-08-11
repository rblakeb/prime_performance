class SetUpNoochClients < ActiveRecord::Migration[5.2]
  def change
	add_column :nutrition_clients, :name, :string
	add_column :nutrition_clients, :email, :string
	add_column :nutrition_clients, :protein, :integer
	add_column :nutrition_clients, :fat, :integer
	add_column :nutrition_clients, :carbs, :integer
	add_column :nutrition_clients, :start_date, :date
	add_column :nutrition_clients, :active, :boolean, default: true
  end
end
