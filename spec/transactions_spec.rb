# frozen_string_literal: true

require 'transactions'

describe Transactions do
  let(:trans) { Transactions.new }
  context 'Check that items passed are correctly converted' do
    it 'converts date with dashes to correct format' do
      date_reformat = trans.date_reformat('01-01-2020')
      expect(date_reformat).to eq('01/01/2020')
    end
    it 'reformats currency to insert decimal zeros' do
      currency_reformatted = trans.format_currency(100)
      expect(currency_reformatted).to eq('100.00')
    end
    it 'converts currency with decimals to text without changing it' do
      currency_reformatted = trans.format_currency(234.56)
      expect(currency_reformatted).to eq('234.56')
    end
  end
end
# Split object block - Rubocop complaining.
describe Transactions do
  let(:trans) { Transactions.new }
  context 'Check formatting for records'
  it 'writes a deposit correctly' do
    test_deposit = trans.line_formatter('deposit', '31/12/2019', '1000.00', \
                                        '1000.00')
    expect(test_deposit).to eq('31/12/2019 || 1000.00 || || 1000.00')
  end
  it 'writes a withdrawal correctly' do
    test_withdrawal = trans.line_formatter('withdrawal', '08/09/1987', \
                                           '500.00', '756.06')
    expect(test_withdrawal).to eq('08/09/1987 || || 500.00 || 756.06')
  end

  context 'It writes transactions to the array correctly' do
    it 'writes a deposit correctly' do
      trans.output_writer('deposit', '01-01-2001', 345, 1720.34)
      test_output = trans.ledger[0]
      expect(test_output).to eq('01/01/2001 || 345.00 || || 1720.34')
    end
  end
  it 'writes a withdrawal correctly' do
    trans.output_writer('withdrawal', '08-09-1982', 327, 555.45)
    test_output = trans.ledger[0]
    expect(test_output).to eq('08/09/1982 || || 327.00 || 555.45')
  end
end
