class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, allow_blank: false
  validates :overview, presence: true, allow_blank: false
  validates :title, uniqueness: true
end
