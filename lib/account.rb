require_relative 'transaction_log.rb'

class Account

  attr_reader :balance, :transaction_log

  def initialize(specified_class = TransactionLog)
    @balance = 0
    @transaction_log = specified_class.new
  end

  def deposit(funds)
    @balance += funds
    transaction_log.record_transaction(funds, @balance)
  end

  def withdraw(funds)
    @balance -= funds
    transaction_log.record_transaction(-funds, @balance)
  end

  def statement
    return_string = "date || credit || debit || balance\n"
    transaction_log.transactions.each do |transaction|
      return_string += "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
    print return_string
  end

end
