# frozen_string_literal: true

require 'date'
require_relative 'statement'

# main bank account class responsible for changes to the account balance
class BankAccount
  attr :balance, :statement

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(credit)
    @balance += credit
    @statement.update_statement(@balance, credit: credit)
  end

  def withdraw(debit)
    @balance -= debit
    @statement.update_statement(@balance, debit: debit)
  end

  def print_statement
    @statement.print_statement
  end
end
