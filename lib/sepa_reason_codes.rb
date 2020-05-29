# frozen_string_literal: true

require 'sepa_reason_codes/version'
require 'yaml'

# Usage:
#
# SepaReasonCodes.find('AC01')
#
# @returns ReasonCodeStruct{
#   code: 'AC01',
#   iso_name: '',
#   description: '',
#   probable_status: ''
# }

module SepaReasonCodes
  class Error < StandardError; end

  ParsedReasonCodes =
    YAML.load_file(File.join(__dir__, ['reason_codes.yml'])).freeze

  ReasonCodeStruct =
    Struct.new(:code, :iso_name, :description, :probable_status)

  # @param ~String~ Sepa Reason Code; Case insensitive
  # Read more at : https://www.hettwer-beratung.de/sepa-spezialwissen/sepa-reason-codes/

  # Parses lib/reason_codes.yml, retrieves and
  # returns ReasonCode Struct with accessors
  # code, iso_name, description, probable_status

  def self.find(code)
    reason_code =
      ParsedReasonCodes.fetch(code&.upcase, nil)

    return unless reason_code

    ReasonCodeStruct.new(
      reason_code.fetch('code'),
      reason_code.fetch('iso_name'),
      reason_code.fetch('description'),
      reason_code.fetch('probable_status')
    )
  end
end
