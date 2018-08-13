class NutritionClient < ApplicationRecord
	belongs_to :nutrition_coach, class_name: 'NutritionCoach', foreign_key: 'nutrition_coach_id'

	default_scope { order(active: 'DESC') }
end
