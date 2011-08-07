module Euler
  class Problem4
    attr_reader :solution

    def initialize(num_of_digits_in_factor, base=10)
      @num_of_digits_in_factor = num_of_digits_in_factor
      @base = base
      @largest_factor = largest_n_digit_num
      @smallest_factor = smallest_n_digit_num
      @solution = largest_palindrome_with_factors(largest_palindrome).to_s(@base)
    end

    private

    def largest_palindrome_with_factors(palin)
      @largest_factor.downto(@smallest_factor) do |i|
        if palin % i == 0
          f1 = i
          i.downto(@smallest_factor) do |j|
            if j*f1 == palin
              return palin
            end
          end
        end
      end
      if palin < @smallest_factor**2
        -1
      else
        largest_palindrome_with_factors(NextLowestPalindrome.find(palin-1, @base))
      end
    end

    def largest_palindrome
      NextLowestPalindrome.find(upper_bound, @base)
    end

    def smallest_n_digit_num
      @base**(@num_of_digits_in_factor - 1)
    end

    def largest_n_digit_num
      @base**@num_of_digits_in_factor - 1
    end

    def upper_bound
      @largest_factor**2
    end
  end

  private

  class NextLowestPalindrome
    class << self
      def find(n, base=10)
        @base = base
        @n_org = n
        find_palindrome(n, max, min, 0)
      end

      private

      def max
        @base**num_of_digits
      end

      def min
        1
      end

      def num_of_digits
        (Math.log10(@n_org)/Math.log10(@base)).truncate
      end

      def adjust_palin(i, j, palin)
      if palin < @n_org
          palin
        else
          adjust_palin(i, j, palin-(i+j))
        end
      end

      def find_palindrome(n, i, j, palin)
        p = (n/i).truncate
        ip = i*p
        jp = j*p
        palin += ip+jp
        ib = i/@base
        jb = j*@base
        if ib <= jb
          adjust_palin(i, j, palin)
        else
          find_palindrome(n-ip, ib, jb, palin)
        end
      end
    end
  end
end
