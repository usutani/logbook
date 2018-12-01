class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  belongs_to :user
end
