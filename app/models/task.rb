class Task < ApplicationRecord
  belongs_to :user
  has_many :workers,dependent: :destroy

  validates :description, presence: true, length: { minimum: 4, maximum: 254 }
  validates :amount , presence: true,format: {with: /\A[+-]?\d+(\.[\d]+)?\z/  , message: "Amount invalid"}
end
