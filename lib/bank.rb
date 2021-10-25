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

  def print_statement
    statement_to_print = "date || credit || debit || balance"
    @statement.reverse_each do |transaction|
      statement_to_print += "\n#{transaction[:date]} ||#{format_number(transaction[:credit])} ||#{format_number(transaction[:debit])} ||#{format_number(transaction[:balance])}"
    end
    statement_to_print
  end

  def format_number(number)
    return "" if number == nil
    ' %.2f' % number.to_f
  end
    
end