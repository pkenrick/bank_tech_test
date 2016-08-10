require 'transaction_log'

describe TransactionLog do

  subject(:transaction_log){described_class.new}
  let(:transaction_class){double :transaction_class, new: transaction}
  let(:transaction){double :transaction, amount: 100}

  context 'upon initialisation' do
    it 'initialises with an empty array of transactions' do
      expect(transaction_log.transactions).to eq([])
    end
  end

  context '#record_transaction' do
    it 'adds a transaction to the array of transactions' do
      transaction_log.record_transaction(100, 100, transaction_class)
      expect(transaction_log.transactions[0]).to eq(transaction)
    end
  end

end
