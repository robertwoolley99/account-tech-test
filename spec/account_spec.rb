# frozen_string_literal: true

# Although there is no formal front end, these tests are
# defacto functional tests.

require 'account'

describe Account do
  let(:account) { Account.new }
  context 'deposits and withdrawals' do
    it 'stores a deposit transaction and can print it' do
      account.deposit(1000, '10-01-2012')
      output = account.statement
      expect(output).to include('10/01/2012 || 1000.00 || || 1000.00')
    end
    it 'can handle multiple deposit transactions' do
      account.deposit(1000, '10-01-2012')
      account.deposit(2000, '13-01-2012')
      output = account.statement
      expect(output).to include('13/01/2012 || 2000.00 || || 3000.00')
    end
    it 'can deal with withdrawals' do
      account.deposit(1000, '10-01-2012')
      account.deposit(2000, '13-01-2012')
      account.withdrawal(500, '14-01-2012')
      output = account.statement
      expect(output).to include('14/01/2012 || || 500.00 || 2500.00')
    end
  end
end

describe Account do
  let(:account) { Account.new }
  context 'statements ' do
    it 'has a header as requested' do
      account.deposit(500, '25-12-2019')
      output = account.statement
      expect(output).to include('date || credit || debit || balance')
    end
  end
end
