class Book < ActiveRecord::Base
	belongs_to :user
	has_many :chapters

	acts_as_taggable
	
	validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }
	validates :description, length: { minimum: 3, maximum: 100 }
end
