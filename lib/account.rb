class Account
  attr_reader :balance
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value, date)
    if value % 1 != 0
      deposit_as_a_string = value.to_s
    else
      deposit_as_a_string = value.to_s + ".00"
    end
    @balance += value

    if @balance % 1 != 0
      balance_as_a_string = @balance.to_s
    else
      balance_as_a_string = @balance.to_s + ".00"
    end

    this_deposit = date + " || "+ deposit_as_a_string + " || || " + balance_as_a_string
    @transactions.push(this_deposit)
  end

def statement
  output = ""
  @transactions.each do |line_item|
    output += line_item
  end
end

end
