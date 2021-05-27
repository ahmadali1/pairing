class Contract < ApplicationRecord
  belongs_to :customer

  validates :start_date, :end_date, presence: true
  validates :active, uniqueness: { scope: :customer_id }, if: :active
  # TODO: other validations i.e. start_date > end_date
end
