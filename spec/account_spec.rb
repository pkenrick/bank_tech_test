require 'account'

describe Account do

  subject(:account) {described_class.new(transaction_log_class)}
  let(:transaction_log_class){double :transaction_log_class, new: transaction_log}
  let(:transaction_log){double :transaction_log, transactions: [transaction1, transaction2]}
  let(:transaction1){double :transaction, credit: 70, debit: 0, balance: 70, date: Date.today}
  let(:transaction2){double :transaction, credit: 0, debit: 30, balance: 40, date: Date.today}

  context 'upon initialisation' do
    it 'has an initial balance of zero' do
      expect(account.balance).to eq(0)
    end
    it 'creates a new instance of TransactionLog' do
      expect(account.transaction_log).to eq(transaction_log)
    end
  end

  context 'excuting transactions' do
    before(:each) do
      allow(transaction_log).to receive(:record_transaction)
    end

    context '#deposit' do
      it 'allows user to deposit money' do
        account.deposit(100)
        expect(account.balance).to eq(100)
      end
    end

    context '#withdraw' do
      it 'allows user to withdraw money' do
        account.deposit(80)
        account.withdraw(40)
        expect(account.balance).to eq(40)
      end
    end
  end

  context '#statement' do
    it 'prints a statement of all transactions of on the account' do
      expect{account.statement}.to output("date || credit || debit || balance\n2016-08-10 || 70 || 0 || 70\n2016-08-10 || 0 || 30 || 40\n").to_stdout
    end
  end

end
