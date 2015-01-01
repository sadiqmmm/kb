class Section < ActiveRecord::Base
  belongs_to :chapter
  
  acts_as_taggable

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :chapter_id  
end