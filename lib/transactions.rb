# frozen_string_literal: true

# Object to store and process transactions. Back end of application.
# Using attribute reader for ledger as object is encapsulated inside
# Account.
class Transactions
  attr_reader :ledger

  def initialize
    @ledger = []
  end

  def date_reformat(date_entered)
    date_entered.gsub(/-/, '/')
  end

  def format_currency(input)
    output = input.to_s
    return output unless (input % 1).zero?

    output + '.00'
  end

  def line_formatter(transaction_type, date_reformatted, \
                     value_as_a_string, balance_as_a_string)
    middle_bit_of_transaction = if transaction_type == 'deposit'
                                  value_as_a_string + ' || || '
                                else
                                  '|| ' + value_as_a_string + ' || '
                                end
    date_reformatted + ' || ' + middle_bit_of_transaction + \
      balance_as_a_string
  end

  def output_writer(transaction_type, date, value, balance)
    date_reformatted = date_reformat(date)
    value_as_a_string = format_currency(value)
    balance_as_a_string = format_currency(balance)
    this_transaction = line_formatter(transaction_type, \
                                      date_reformatted, value_as_a_string, \
                                      balance_as_a_string)
    @ledger.push(this_transaction)
  end
end
