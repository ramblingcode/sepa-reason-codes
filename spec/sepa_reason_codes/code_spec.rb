# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SepaReasonCodes::Code do
  describe '#==' do
    let(:attrs) do
      {
        code: 'code',
        iso_name: 'iso_name',
        description: 'description',
        probable_status: 'status'
      }
    end

    it "returns true if (other) instance's attributes are equal" do
      reason_code = described_class.new(attrs)

      other_reason_code = described_class.new(attrs)

      expect(reason_code == other_reason_code).to eq(true)
    end

    it "returns false if (other) instance's attributes are not equal" do
      reason_code = described_class.new(attrs)

      other_reason_code = described_class.new(attrs.merge(code: 'different_code'))

      expect(reason_code == other_reason_code).to eq(false)
    end
  end
end
