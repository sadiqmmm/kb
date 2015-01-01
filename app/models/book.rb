class Book < ActiveRecord::Base
	belongs_to :user
	has_many :chapters

	acts_as_taggable

	validates :name, presence: true, length: { minimum: 3, maximum: 100 }
	validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :user_id
	validates :description, length: { maximum: 500 }
end
