# frozen_string_literal: true

RSpec.describe SepaReasonCodes do
  it 'has a version number' do
    expect(SepaReasonCodes::VERSION).not_to be nil
  end

  context 'when reason code exists' do
    it 'returns reason code struct' do
      reason_code = 'AC01'

      result = described_class.find(reason_code)
      expect(result.code).to eq('AC01')
      expect(result.iso_name).to eq('Incorrect Account Number')
      expect(result.description).to eq(
        'Account number is invalid or missing. Format of the account number specified is not correct'
      )
      expect(result.probable_status).to eq('declined')
    end
  end

  context "when reason code doesn't exist" do
    it 'returns nil' do
      expect(described_class.find('doesnt-exist')).to be_nil
    end
  end
end
