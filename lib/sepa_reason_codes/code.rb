# frozen_string_literal: true

module SepaReasonCodes
  class Code
    ATTRS = %i[code iso_name description probable_status].freeze

    attr_reader(*ATTRS)

    def initialize(code:, iso_name:, description:, probable_status:)
      @code = code
      @iso_name = iso_name
      @description = description
      @probable_status = probable_status
    end

    def ==(other)
      ATTRS.all? do |attribute|
        other.public_send(attribute) == public_send(attribute)
      end
    end
  end
end
