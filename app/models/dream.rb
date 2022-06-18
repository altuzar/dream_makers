class Dream < ApplicationRecord
  validates :description, presence: true
  validates :email, presence: true
end
