class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections
  
  validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :book_id
  validates :description, length: { minimum: 3, maximum: 100 }
end