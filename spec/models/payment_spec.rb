require 'rails_helper'
require 'stripe_mock'

describe Cart do
  let(:stripe_helper) {StripeMock.create_test_helper}
  before {StripeMock.start}
  after {StripeMock.stop}

  it "creates a stripe customer" do
    customer = Stripe::Customer.create({
                                           email: 'johnny@appleseed.com',
                                           card: stripe_helper.generate_card_token
                                       })
    expect(customer.email).to eq('johnny@appleseed.com')
  end
end