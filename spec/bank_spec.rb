require 'bank'
require 'date'

describe 'bank_account' do
  it 'can store a sum that is deposited' do
    account = Bank_account.new
    account.deposit(100)
    expect(account.balance).to equal(100)
  end

  it 'can store multiple sums that are deposited' do
    account = Bank_account.new
    account.deposit(100)
    account.deposit(50)
    expect(account.balance).to equal(150)
  end

  it 'can update the balance as money is withdrawn' do
    account = Bank_account.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to equal(50)
  end

  it 'can store the details of the transaction including the date' do
    account = Bank_account.new
    allow(Date).to receive(:today).and_return Date.new(2023,1,10)
    account.deposit(100)
    expect(account.statement[0][:date]).to eq('10/01/2023')
  end

  it 'can store the details of the deposit' do
    account = Bank_account.new
    account.deposit(1000)
    expect(account.statement[0][:credit]).to eq(1000)
    expect(account.statement[0][:debit]).to eq(nil)
  end

  it 'can store the details of the deposit/withdrawal' do
    account = Bank_account.new
    account.withdraw(500)
    expect(account.statement[0][:credit]).to eq(nil)
    expect(account.statement[0][:debit]).to eq(500)
  end

  it 'can store the details of the balance' do
    account = Bank_account.new
    account.deposit(1000)
    expect(account.statement[0][:balance]).to eq(1000)
  end

end