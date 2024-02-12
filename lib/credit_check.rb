class CreditCheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  # def luhn_algorithm
  #   numbers = card_number.split('').map(&:to_i).select.with_index { |_, i| i.even? }
  #   odd_numbers = card_number.split('').map(&:to_i).select.with_index { |_,i| i.odd? }
  #   sum_nums = []

  #   numbers.each do |number|
  #     if number * 2 > 9
  #       sum_nums << number * 2
  #     else
  #       return "The number #{card_number} is invalid!"
  #     end
  #   end

  #   x = sum_nums.flat_map { |num| num.to_s.split('').map(&:to_i) }
  #   x << odd_numbers
  #   sum = x.sum

  #   if sum % 10 == 0
  #     return "The number #{card_number} is valid!"
  #   else
  #     return "The number #{card_number} is invalid!"
  #   end
  #end

  def luhn_algorithm
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
      return "The number #{card_number} is valid!"
    else
      return "The number #{card_number} is invalid!"
    end
  end
end


