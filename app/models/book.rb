class Book < ActiveRecord::Base
	has_many :chapters
	
	validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }
end
