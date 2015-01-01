class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections
  
  acts_as_taggable
  
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :book_id
  validates :description, length: { maximum: 500 }
end