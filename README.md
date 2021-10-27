# Bank Tech Test

## Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)  
Deposits, withdrawal.  
Account statement (date, amount, balance) printing.  
Data can be kept in memory (it doesn't need to be stored to a database or anything).  
  

## Acceptance Criteria
  
Given a client makes a deposit of 1000 on 10-01-2023  
And a deposit of 2000 on 13-01-2023  
And a withdrawal of 500 on 14-01-2023  
When she prints her bank statement  
Then she would see  
  
```date || credit || debit || balance  
14/01/2023 || || 500.00 || 2500.00  
13/01/2023 || 2000.00 || || 3000.00  
10/01/2023 || 1000.00 || || 1000.00
```  
  

## Installation and Testing
  
There are not installation requirements for the application outside of having a version of Ruby installed. To run the tests navigate to the bank_tech_test folder on your local drive in terminal and run

```ruby
rspec
```

To run the application follow the usage instructions below.


## Approach
  
My approach to this application was to focus on making something that could easily be extended and further developed in order to be utilysed in an industry setting. By keeping an array of hashes it would be straightforward to add in further details regarding the transaction. Keeping each account as a seperate instantiation of the class also opens up the possibility to add in further account details (customer name, account number, etc.) into the class initialize method for easy reference.
  
  
## Usage

```ruby
require './lib/bank'

# to instantiate the BankAccount class
account_name = BankAccount.new

# document a deposit into the account
account_name.deposit(100)

# document a deposit into the account
account_name.withdraw(100)

# print to screen the statement for this account
puts(account_name.print_statement)
```
  
  
## Example Usage
<img width="937" alt="Screenshot 2021-10-25 at 16 10 52" src="https://user-images.githubusercontent.com/84837127/138723546-1e595b3a-1d74-4436-8396-6bb236f7fbd2.png">
  
  
## Further Testing
Tested with [RSpec]https://rspec.info/
Style checked with [RuboCop](https://github.com/rubocop/rubocop)
Testing coverage monitored using [SimpleCov]https://github.com/simplecov-ruby/simplecov