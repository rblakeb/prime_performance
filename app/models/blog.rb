class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  paginates_per 10

	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings, dependent: :destroy

  default_scope { order('created_at DESC') }

  validates_presence_of :author, presence: true
  validates_presence_of :content, presence: true
  validates_presence_of :name, presence: true

	# def slug
 #    self.name.downcase.gsub(" ", "-")
 #  end

  # def to_param
  #   "#{id}-#{slug}"
  # end

	def self.tagged_with(name)
    	Tag.find_by!(name: name).blogs
  	end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
