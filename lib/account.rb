class Account
  attr_reader :balance
  def initialize
    @balance = 0
  end

def deposit (deposit_amount)
  @balance += deposit_amount

end
end
