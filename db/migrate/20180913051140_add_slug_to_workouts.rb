class AddSlugToWorkouts < ActiveRecord::Migration[5.2]
  change_table :workouts do |t|
    t.string :slug, after: :id
  end 
end
