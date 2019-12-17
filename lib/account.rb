# frozen_string_literal: true

require 'transactions'
# Account object, does what you would expect... front end of application.
class Account
  def initialize
    @balance = 0
    @transactions = Transactions.new
  end

  def deposit(value, date)
    @balance += value
    @transactions.output_writer('deposit', date, value, @balance)
  end

  def withdrawal(value, date)
    @balance -= value
    @transactions.output_writer('withdrawal', date, value, @balance)
  end

  def statement
    output = "date || credit || debit || balance \n"
    array = ''
    @transactions.ledger.each do |line_item|
      array += line_item
      array += "\n"
    end
    output + array
  end
end
