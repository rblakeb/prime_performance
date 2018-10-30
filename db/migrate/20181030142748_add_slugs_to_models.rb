class AddSlugsToModels < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :slug, :string
  	add_column :articles, :slug, :string
  end
end
