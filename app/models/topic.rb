class Topic < ActiveRecord::Base
	validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }
end
