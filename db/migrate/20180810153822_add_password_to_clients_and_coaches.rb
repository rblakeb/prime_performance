class AddPasswordToClientsAndCoaches < ActiveRecord::Migration[5.2]
  def change
  	add_column :nutrition_clients, :password, :string
  	add_column :nutrition_coaches, :password, :string
  	add_column :nutrition_clients, :bodyweight, :integer
  end
end
