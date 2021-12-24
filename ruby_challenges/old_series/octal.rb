# octal.rb - Octal

=begin
Implement octal to decimal conversion. Given an octal input string, your
program should produce a decimal output.

Note:
Implement the conversion yourself. Do not use something else to perform the
conversion for you. Treat invalid input as octal 0.

About Octal (Base-8):
Decimal is a base-10 system.
A number 233 in base 10 notation can be understood as a linear combination
of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next number gets multiplied by 101 = 10
...
The n*th number gets multiplied by 10n-1*.
All these values are summed.
So:
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1

Octal is similar, but uses powers of 8 rather than powers of 10. So:
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

=end

=begin --> PEDAC

problem/rules:
  - convert the given integer to a base 8 number

input: integer
output: integer

data structure:
  - class Octal takes one string argument
  - initialize method with @digits converts string to integer
    then array with Integer#digits
  - instance method to_decimal performs conversion

algorithm:
  - comvert given str to integer
  - convert integer to array with #digits
  - initialize RESULT to 0
  - iterate through array with index, using index as to the index power
  - return result

=end

class Octal
  def initialize(str)
    @str = remove_leading_zeros(str)
    @digits = @str.to_i.digits
    @result = 0
  end

  def remove_leading_zeros(str)
    while str.size > 1 && str[0] == '0'
      str[0] = ''
    end
    str
  end

  def to_decimal
    return 0 if @digits.size != @str.size || @digits.include?(9) ||
                @digits.size == 1 && (@digits[0] > 1 && @digits[0] < 10)
    @digits.each_with_index { |num, idx| @result += num * (8**idx) }
    @result
  end
end

Octal.new('233').to_decimal
Octal.new('1').to_decimal
Octal.new('11').to_decimal
Octal.new('17').to_decimal
Octal.new('130').to_decimal
Octal.new('10').to_decimal
