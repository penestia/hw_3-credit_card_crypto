module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    # We use chars so we can break into individual digits, then fixnum
    # then map each character by calling #to_i on it
    # reverse - so we start from the end
    nums_a = number.to_s.chars.map(&:to_i).reverse!
    # each_with_index - terates the given block for each elements with an index
    sum = nums_a.each_with_index.reduce(0) do |account, pair|
      element, index = pair
      # Check if its odd and the element is > 4
      if index.odd? && element > 4
        # Double every number and substract by 9
        account + element * 2 - 9
      elsif index.odd?
        account + element * 2
      else
        account + element
      end
    end
    # If the sum is multiple of 10 then end
    (sum % 10).zero? 
  end
end
