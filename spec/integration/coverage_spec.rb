require 'rails_helper'

RSpec.describe 'System Integration' do
  describe 'Coverage Change' do
    let(:invoice) { create(:invoice) }

    context 'Invoicing' do
      before do
        @contract = invoice.contract
        @contract.update_coverage(200, Date.today)
      end

      it 'Checks creation of new invoice' do
        expect(@contract.invoices.count).to eq(2)
      end

      it 'Checks creation of contract logs' do
        expect(@contract.contract_logs.count).to eq(1)
      end

      it 'Checks new invoice amount' do
        expect(@contract.invoices.last.amount.to_i).to eq(60)
      end
    end
  end
end
