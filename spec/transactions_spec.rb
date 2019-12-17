# frozen_string_literal: true

require 'transactions'

describe Transactions do
  let(:trans) { Transactions.new }
  context 'Check that items passed are correctly converted' do
    it 'converts date with dashes to correct format' do
      date_reformat = trans.date_reformat('01-01-2020')
      expect(date_reformat).to include('01/01/2020')
    end
  end
end
