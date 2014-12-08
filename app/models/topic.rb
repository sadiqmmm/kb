class Topic < ActiveRecord::Base
	validates :name, length: { minimum: 3, maximum: 100 }
end
