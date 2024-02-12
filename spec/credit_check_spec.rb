require './lib/credit_check'

RSpec.describe "Credit Check" do
  it "validates correct card numbers" do
    card_number_1 = "5541808923795240"
    card_number_2 = "4024007136512380"
    card_number_3 = "6011797668867828"

    credit_check_1 = CreditCheck.new(card_number_1)
    credit_check_2 = CreditCheck.new(card_number_2)
    credit_check_3 = CreditCheck.new(card_number_3)

    expect(credit_check_1.luhn_algorithm).to eq("The number 5541808923795240 is valid!")
    expect(credit_check_2.luhn_algorithm).to eq("The number 4024007136512380 is valid!")
    expect(credit_check_3.luhn_algorithm).to eq("The number 6011797668867828 is valid!")
  end

  it "does not validate incorrect card numbers" do
    card_number_1 = "5541801923795240"
    card_number_2 = "4024007106512380"
    card_number_3 = "6011797668868728"

    credit_check_1 = CreditCheck.new(card_number_1)
    credit_check_2 = CreditCheck.new(card_number_2)
    credit_check_3 = CreditCheck.new(card_number_3)

    expect(credit_check_1.luhn_algorithm).to eq("The number 5541801923795240 is invalid!")
    expect(credit_check_2.luhn_algorithm).to eq("The number 4024007106512380 is invalid!")
    expect(credit_check_3.luhn_algorithm).to eq("The number 6011797668868728 is invalid!")
  end
end