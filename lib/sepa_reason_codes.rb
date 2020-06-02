# frozen_string_literal: true

require 'sepa_reason_codes/version'
require 'sepa_reason_codes/code'

require 'yaml'

module SepaReasonCodes
  class Error < StandardError; end

  PARSED_REASON_CODES =
    YAML.load_file(File.join(__dir__, ['reason_codes.yml'])).freeze

  # @param ~String~ Sepa Reason Code; Case insensitive
  # Read more at : https://www.hettwer-beratung.de/sepa-spezialwissen/sepa-reason-codes/

  # Parses lib/reason_codes.yml, retrieves and
  # returns SepaReasonCodes::Code with accessors
  # code, iso_name, description, probable_status

  # Usage:
  #
  # SepaReasonCodes.find('AC01')
  #
  # @returns SepaReasonCodes::Code{
  #   code: 'AC01',
  #   iso_name: '...',
  #   description: '...',
  #   probable_status: '...'
  # }

  def self.find(code)
    reason_code_data = PARSED_REASON_CODES.fetch(code&.upcase, nil)

    return unless reason_code_data

    reason_code(reason_code_data)
  end

  # @returns collection [SepaReasonCodes::Code]

  def self.all
    PARSED_REASON_CODES.values.map do |reason_code_data|
      reason_code(reason_code_data)
    end
  end

  # @api private

  def self.reason_code(reason_code_data)
    Code.new(
      code: reason_code_data.fetch('code'),
      iso_name: reason_code_data.fetch('iso_name'),
      description: reason_code_data.fetch('description'),
      probable_status: reason_code_data.fetch('probable_status')
    )
  end

  private_constant :PARSED_REASON_CODES
  private_class_method :reason_code
end
