class Dream < ApplicationRecord
  validates :description, presence: true
  validates :email, presence: true

  scope :published, -> { where("published = true") }
end
