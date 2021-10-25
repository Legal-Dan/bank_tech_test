class Bank_account
  attr :balance
  
  def initialize
    @balance = 0
  end

  def deposit(credit)
    @balance += credit
  end

  def withdraw(debit)
    @balance -= debit
  end
end