# frozen_string_literal: true

# Account object, does what you would expect...
class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, date)
    @balance += value
    output_writer('deposit', date, value, @balance)
  end

  def withdrawal(value, date)
    @balance -= value
    output_writer('withdrawal', date, value, @balance)
  end

  def statement
    output = "date || credit || debit || balance \n"
    array = ''
    @transactions.reverse.each do |line_item|
      array += line_item
      array += "\n"
    end
    output + array
  end

  private

  def date_reformat(date_entered)
    date_entered.gsub(/-/, '/')
  end

  def output_writer(transaction_type, date, value, balance)
    date_reformatted = date_reformat(date)
    value_as_a_string = format_currency(value)
    balance_as_a_string = format_currency(balance)
    this_transaction = line_formatter(transaction_type, \
                                      date_reformatted, value_as_a_string, \
                                      balance_as_a_string)
    @transactions.push(this_transaction)
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

  def format_currency(input)
    output = input.to_s
    return unless (input % 1).zero?

    output + '.00'
  end
end
