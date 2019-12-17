# Read me for Bank Account Technical Test Programme


## Installation and tests

Clone the github repo to your local machine.

Run bundle install to update your local gems.

rspec to run the unit tests.

rubocop to check the code linting.

To run the code from irb.

require './lib/account.rb'

bank = Account.new


To deposit money e.g. £1000.50 on 31-12-2019

from irb:

bank.deposit(1000.50, "31-12-2019")

To withdraw money - e.g. £500 on 15-2-2020

bank.withdrawal(500, "15-2-2020")

To see statement

statement = bank.statement
puts statement

## Approach

The approach is to provide three public facing methods:  
1. Statement.  
2. Deposit.  
3. Withdrawal.

Statement prints a statement of transactions in reverse order entered along with a header showing what each column covers.

Deposit and Withdrawal record deposit and withdrawal actions.  Each takes two arguments when called - the amount and date.  Each method adjusts the balance and then calls  a private method 'output_writer'.


a) Converts dates in dashed format  (e.g. 31-12-12) to the required format (e.g. 31/12/12) (does this by passing the date to   'date\_reformat' method).   
b) Converts currency (transaction value, balance) from a real/integer to a string and adds .00 to integers. (Does this by passing the details to a format_currency method). 
c) Passes date and string formatted balance and transaction values (along with transaction type) to line\_formatter.

Line\_formatter creates a variable  which is the transaction entry.  This is made up of:
  a) Date.   
  b) 'Middle bit of transaction' - either the deposit or withdrawal item along with padding and pipes
  c) Balance.
  Line\_formatter returns this to output\_writer and sends this to @transactions which is the array which holds the transactions.
  
##   Structure
  The code is structured into a series of methods which avoid repetition.
  
  It is designed to be logical to use in terms of the methods selected.
  
##   Screenshot of Program In Use
[Illustration here](https://github.com/robertwoolley99/account-tech-test/screenshot)
  

