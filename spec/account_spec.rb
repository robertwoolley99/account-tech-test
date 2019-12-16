# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) {Account.new}
  context 'create account' do

    it 'stores a deposit transaction and can print it' do
      account.deposit(1000, "10/01/2012")
      output = account.statement
      expect(output).to include("10/01/2012 || 1000.00 || || 1000.00")
    end
  end
end
