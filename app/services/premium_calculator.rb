class PremiumCalculator

  # TODO: Call some API & return fetch premium amount
  def self.fetch_premium(contract)
    contract.premium + contract.coverage * 2 # just for sake of simplicity
  end

end
