class RemovePublishDateFromWorkouts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :workouts, :publish_date
  end
end
