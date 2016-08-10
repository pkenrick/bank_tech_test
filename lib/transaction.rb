require 'date'

class Transaction

  attr_reader :debit, :credit, :balance, :date

  def initialize(amount, balance, specified_class = Date)
    @credit, @debit = 0, 0
    amount > 0 ? @credit = amount : @debit = -amount
    @date = specified_class.today
    @balance = balance
  end

end
