class CreditCheck
  attr_reader :card_number,
              :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def is_valid?
    numbers = card_number.split('').map(&:to_i)
    sum_nums = []
    counter = 1

    numbers.each do |number|
      if counter.odd?
          sum_nums << number * 2
      else
        sum_nums << number
      end
      counter += 1
    end

    x = sum_nums.flat_map { |num| num.to_s.split('').map(&:to_i) }
    sum = x.sum

    if sum % 10 == 0
      return true
    else
      return false
    end
  end

  def last_four
    last_four_digits = card_number[-4..-1]
  end
end


