class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections
  
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }
  validates :description, length: { minimum: 3, maximum: 100 }
end