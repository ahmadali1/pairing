class Customer < ApplicationRecord
  has_many :contracts
  has_one :active_contract, -> { where(active: true).order(created_at: :desc) }, class_name: "Contract"

  validates :name, presence: true
  # TODO: other validations and unique customer identifier
end
