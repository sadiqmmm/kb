class Section < ActiveRecord::Base
  belongs_to :chapter

  validates_uniqueness_of :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, scope: :chapter_id
  validates :description, length: { minimum: 3, maximum: 50000 }
end