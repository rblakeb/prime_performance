class Workout < ApplicationRecord
	extend FriendlyId
	friendly_id :scheduled_on, use: :slugged

	validates_presence_of :scheduled_on, unique: true

	# def published
	# 	if self.publish_date == Date.current
	# 		self.
	# end

	def current_workout
		self.scheduled_on == Time.now
	end
end
