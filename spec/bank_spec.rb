# frozen_string_literal: true

require 'bank'
require 'date'

final_statement = "date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00"

def mock_date(day)
  allow(Date).to receive(:today).and_return Date.new(2023, 1, day)
end

describe 'bank_account' do
  it 'can store a sum that is deposited' do
    account = BankAccount.new
    account.deposit(100)
    expect(account.balance).to equal(100)
  end
end

describe 'bank_account' do
  it 'can store multiple sums that are deposited' do
    account = BankAccount.new
    account.deposit(100)
    account.deposit(50)
    expect(account.balance).to equal(150)
  end
end

describe 'bank_account' do
  it 'can update the balance as money is withdrawn' do
    account = BankAccount.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to equal(50)
  end
end

describe 'bank_account' do
  it 'can store the details of the transaction including the date' do
    account = BankAccount.new
    mock_date(10)
    account.deposit(100)
    expect(account.statement[0][:date]).to eq('10/01/2023')
  end
end

describe 'bank_account' do
  it 'can store the details of the deposit' do
    account = BankAccount.new
    account.deposit(1000)
    expect(account.statement[0][:credit]).to eq(1000)
    expect(account.statement[0][:debit]).to eq(nil)
  end
end

describe 'bank_account' do
  it 'can store the details of the withdrawal' do
    account = BankAccount.new
    account.withdraw(500)
    expect(account.statement[0][:credit]).to eq(nil)
    expect(account.statement[0][:debit]).to eq(500)
  end
end

describe 'bank_account' do
  it 'can store the details of the balance' do
    account = BankAccount.new
    account.deposit(1000)
    expect(account.statement[0][:balance]).to eq(1000)
  end
end

describe 'bank_account' do
  it 'can print a full statement of account transactions' do
    account = BankAccount.new
    mock_date(10)
    account.deposit(1000)
    mock_date(13)
    account.deposit(2000)
    mock_date(14)
    account.withdraw(500)
    expect(account.print_statement).to eq(final_statement)
  end
end

describe 'bank_account' do
  it 'can print a full statement when given smaller transactions' do
    account = BankAccount.new
    mock_date(10)
    account.deposit(1.5)
    mock_date(14)
    account.withdraw(0.99)
    expect(account.print_statement).to include('0.51')
  end
end
