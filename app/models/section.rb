class Section < ActiveRecord::Base
  belongs_to :chapter

  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }
  validates :description, length: { minimum: 3, maximum: 100 }
end