class Contract < ApplicationRecord
  enum c_type: { yearly: 0, quarterly: 1, monthly: 2 }
  belongs_to :customer
  has_many :contract_logs
  has_many :invoices

  validates :start_date, :end_date, presence: true
  validates :active, uniqueness: { scope: :customer_id }, if: :active
  # TODO: other validations i.e. start_date > end_date

  def update_coverage(_coverage, from)
    return false if self.coverage == _coverage

    new_premium = PremiumCalculator.fetch_premium(self)
    remaining_customer_balance = remaining_balance_at(from)

    ActiveRecord::Base.transaction do
      self.coverage = _coverage
      self.premium = new_premium

      contract_log = self.contract_logs.new(
                       adjusted_at: from,
                       previous_premium: self.premium,
                       reason: "Adjustment due to coverage update|from: #{from.to_s}"
                     )

      self.invoices.new(
        date: Date.today,
        amount: new_premium - remaining_customer_balance,
        is_paid: true, # Suppose, we debit/credit on time of invoice creation
        payment_details: customer.payment_details
      )

      save
    end
  end

  def remaining_balance_at(date)
    used_balance = pro_rata(premium, start_date, end_date) * (date - start_date)

    balance - used_balance
  end

  def balance
    invoices.sum(:amount)
  end

  private

  def pro_rata(amount, from, to)
    return 0 if amount.zero?

    amount / (to - from)
  end
end
