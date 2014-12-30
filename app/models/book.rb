class Book < ActiveRecord::Base
	belongs_to :user
	has_many :chapters

	acts_as_taggable
	
	validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :user_id
	validates :description, length: { minimum: 3, maximum: 100 }
end
