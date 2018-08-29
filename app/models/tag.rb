class Tag < ApplicationRecord
	has_many :taggings, dependent: :destroy
	has_many :blogs, through: :taggings
end
