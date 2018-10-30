class Workout < ApplicationRecord
	extend FriendlyId
	friendly_id :scheduled_on, use: :slugged

	validates_presence_of :scheduled_on, unique: true

	def current_workout
		self.scheduled_on == Time.now
	end
end
