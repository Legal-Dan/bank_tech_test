class Bank_account
  attr :balance
  
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end