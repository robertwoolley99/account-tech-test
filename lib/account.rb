class Account
  attr_reader :balance
  def initialize
    @balance = 0
    @transactions = []
    @transactions.push("date || credit || debit || balance")
  end

  def deposit(value, date)
    @balance += value
    date_reformatted = date.gsub(/-/, '/')
    deposit_as_a_string = format_currency(value)
    balance_as_a_string = format_currency(@balance)
    this_deposit = date_reformatted + " || "+ deposit_as_a_string + \
    " || || " + balance_as_a_string
    @transactions.push(this_deposit)
  end

  def statement
    output = ""
    @transactions.each do |line_item|
      output += line_item
    end
  end

  private

  def format_currency(input)
    output = input.to_s
    if input % 1 == 0
      output += ".00"
    end
  end

end
