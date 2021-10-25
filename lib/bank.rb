require 'date'

class Bank_account
  attr :balance
  attr :statement
  
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(credit)
    @balance += credit
    update_statement(@balance, credit: credit)
  end

  def withdraw(debit)
    @balance -= debit
    update_statement(@balance, debit: debit)
  end

  def update_statement(balance, credit: nil, debit: nil)
    @statement << {
      date: Date.today.strftime("%d/%m/%Y"),
      credit: credit,
      debit: debit,
      balance: balance
    }
  end

end