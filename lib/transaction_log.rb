require_relative 'transaction.rb'

class TransactionLog

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def record_transaction(funds, balance, specified_class = Transaction)
    @transactions << specified_class.new(funds, balance)
  end

end
