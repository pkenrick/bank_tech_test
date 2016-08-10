require 'transaction'

describe Transaction do

  subject(:transaction){described_class.new(100, 100, date_class)}
  let(:date_class){double :date_class, today: date}
  let(:date){double :date}

  it 'initialises with a date, and the correct amount' do
    expect(transaction.date).to eq(date)
    expect(transaction.credit).to eq(100)
  end

end
