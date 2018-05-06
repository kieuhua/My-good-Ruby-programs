# Clean up user-entered phone numbers so that they can be sent SMS messages.
# more details in README.md
class PhoneNumber
  class << self
    def clean(phone)
      return nil unless phone.match?(/\A[0-9,\s,\.,\+,\-,\(,\))]+\z/)

      num_count = phone.scan(/\d+/).join.size
      return nil unless (10..11).member?(num_count)

      if num_count == 11
        return nil unless phone.match?(/\A[1,\+]/) # check 1st char
        if phone.start_with?('+')
          return nil unless phone.start_with?('+1') # check two chars
        end
        phone.strip!
        phone.delete_prefix!('1') if phone.start_with?('1')
        phone.delete_prefix!('+1') if phone.start_with?('+1')
      end

      phone.strip!
      result = ''

      # parse area_code: ddd or (ddd)
      if phone.start_with?('(')
        return nil unless phone.match?(/\A\(\d{3}\)/)
        area_code = phone.scan(/\A\((\d{3})\)/).flatten.first

        return nil if area_code[0] == '1' # area_code > 1
        phone.slice!(0..4)
      else
        return nil unless phone.match?(/\A\d{3}/)
        phone, area_code = parse_digits(phone, 3)
      end
      result << area_code

      # parse exchange number: ddd
      phone, exchange = locals(phone, 3)
      return nil unless exchange[0].to_i > 1 # exchange > 1
      result << exchange

      # parse local number: dddd
      phone, local = locals(phone, 4)
      result << local
    end

    def locals(phone, num)
      phone.strip!
      phone.delete_prefix!('.')
      phone.delete_prefix!('-')
      phone, digits = parse_digits(phone, num)
    end

    def parse_digits(phone, num)
      digits = phone.scan(/\A\d{#{num}}/).flatten.first
      phone.slice!(0..num - 1) unless digits.nil?
      phone.nil? ? ['', digits] : [phone, digits]
    end
  end
end

# module BookKeeping
#   VERSION = 2 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 2
