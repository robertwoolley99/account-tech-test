# frozen_string_literal: true

class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, date)
    @balance += value
    date_reformatted = date.gsub(/-/, '/')
    deposit_as_a_string = format_currency(value)
    balance_as_a_string = format_currency(@balance)
    this_deposit = date_reformatted + ' || ' + deposit_as_a_string + \
                   ' || || ' + balance_as_a_string
    @transactions.push(this_deposit)
  end

  def withdrawal(value, date)
    @balance -= value
    date_reformatted = date.gsub(/-/, '/')
    withdrawal_as_a_string = format_currency(value)
    balance_as_a_string = format_currency(@balance)
    this_withdrawal = date_reformatted + ' || || ' + withdrawal_as_a_string + \
                      ' || ' + balance_as_a_string
    @transactions.push(this_withdrawal)
  end

  def statement
    array = ''
    output = "date || credit || debit || balance \n"
    @transactions.reverse.each do |line_item|
      array += line_item
      array += "\n"
    end
    output += array
  end

  private

  def format_currency(input)
    output = input.to_s
    if input % 1 == 0
      output += '.00'
    end
  end
end
