# frozen_string_literal: true

# stores past transactions and returns bank account statements
class Statement
  attr :recorded_transactions

  def initialize
    @recorded_transactions = []
  end

  def update_statement(balance, credit: nil, debit: nil)
    @recorded_transactions << {
      date: Date.today.strftime('%d/%m/%Y'),
      credit: credit,
      debit: debit,
      balance: balance
    }
  end

  def print_statement
    statement_to_print = 'date || credit || debit || balance'
    @recorded_transactions.reverse_each do |transaction|
      statement_to_print += "\n#{transaction[:date]} ||#{format_number(transaction[:credit])} ||"
      statement_to_print += "#{format_number(transaction[:debit])} ||#{format_number(transaction[:balance])}"
    end
    statement_to_print
  end

  def format_number(number)
    return '' if number.nil?

    format(' %.2f', number.to_f)
  end
end
