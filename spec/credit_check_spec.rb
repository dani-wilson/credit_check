require './lib/credit_check'

RSpec.describe "Credit Check" do
  xit "validates correct card numbers" do
    card_number_1 = "5541808923795240"
    card_number_2 = "4024007136512380"
    card_number_3 = "6011797668867828"

    credit_check_1 = CreditCheck.new(card_number_1, 7000)
    credit_check_2 = CreditCheck.new(card_number_2, 5000)
    credit_check_3 = CreditCheck.new(card_number_3, 1500)

    expect(credit_check_1.luhn_algorithm).to eq("The number 5541808923795240 is valid!")
    expect(credit_check_2.luhn_algorithm).to eq("The number 4024007136512380 is valid!")
    expect(credit_check_3.luhn_algorithm).to eq("The number 6011797668867828 is valid!")
  end

  xit "does not validate incorrect card numbers" do
    card_number_1 = "5541801923795240"
    card_number_2 = "4024007106512380"
    card_number_3 = "6011797668868728"

    credit_check_1 = CreditCheck.new(card_number_1, 1000)
    credit_check_2 = CreditCheck.new(card_number_2, 4000)
    credit_check_3 = CreditCheck.new(card_number_3, 2100)

    expect(credit_check_1.luhn_algorithm).to eq("The number 5541801923795240 is invalid!")
    expect(credit_check_2.luhn_algorithm).to eq("The number 4024007106512380 is invalid!")
    expect(credit_check_3.luhn_algorithm).to eq("The number 6011797668868728 is invalid!")
  end

  it "exists and has attributes" do
    credit_check = CreditCheck.new("5541808923795240", 1500)

    expect(credit_check).to be_a(CreditCheck)

    expect(credit_check.card_number).to eq("5541808923795240")
    expect(credit_check.limit).to eq(1500)
  end

  # changed luhn_algorithm method to is_valid? method for user stories.
  it "validates correct card numbers" do
    card_number_1 = "5541808923795240"
    card_number_2 = "4024007136512380"
    card_number_3 = "6011797668867828"
    card_number_4 = "5541801923795240"
    card_number_5 = "4024007106512380"
    card_number_6 = "6011797668868728"

    credit_check_1 = CreditCheck.new(card_number_1, 7000)
    credit_check_2 = CreditCheck.new(card_number_2, 5000)
    credit_check_3 = CreditCheck.new(card_number_3, 1500)
    credit_check_4 = CreditCheck.new(card_number_4, 1000)
    credit_check_5 = CreditCheck.new(card_number_5, 4000)
    credit_check_6 = CreditCheck.new(card_number_6, 2100)
    

    expect(credit_check_1.is_valid?).to eq(true)
    expect(credit_check_2.is_valid?).to eq(true)
    expect(credit_check_3.is_valid?).to eq(true)
    expect(credit_check_4.is_valid?).to eq(false)
    expect(credit_check_5.is_valid?).to eq(false)
    expect(credit_check_6.is_valid?).to eq(false)
  end

  it "returns the last four digits of each card" do
    card_number_1 = "5541808923795240"
    credit_check_1 = CreditCheck.new(card_number_1, 7000)

    expect(credit_check_1.last_four).to eq("5240")
  end
end