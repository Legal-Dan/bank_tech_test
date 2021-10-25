require 'bank'

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
end