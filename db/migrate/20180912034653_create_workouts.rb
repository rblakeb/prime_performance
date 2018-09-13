class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
    	t.date :scheduled_on
    	t.datetime :publish_date
    	t.text :content
      t.timestamps
    end
  end
end
