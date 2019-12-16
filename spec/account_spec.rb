require 'account'

describe Account do
  context 'create account' do
    it 'has a nil balance when opened' do
      account = Account.new
      expect(account.balance).to eq(0)
    end
  end
end
