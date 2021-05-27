class Invoice < ApplicationRecord
  belongs_to :contract

  validates :amount, :payment_details, presence: true
  # TODO: add approprate attributes & validations


  # allow the creation, prevent delete | update
  def readonly?
    new_record? ? false : true
  end
end
