require 'account'

describe Account do
  let(:account) {Account.new}
  context 'create account' do

    it 'has a nil balance when opened' do
      expect(account.balance).to eq(0)
    end
    it 'has a deposit method which correctly updates the balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end
  end
end
