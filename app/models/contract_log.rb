class ContractLog < ApplicationRecord
  belongs_to :contract

  # TODO: VALIDATES ADJUSTED_AT SHOULD BE BETWEEN CONTRACT.START_DATE..CONTRACT.END_DATE
end
