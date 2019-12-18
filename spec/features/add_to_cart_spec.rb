require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
          @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end

  end

  scenario "My Cart has 1 item when user Added one product to chart" do
    # ACT
    visit root_path
    expect(page).to have_text 'My Cart (0)', count: 1
    page.find_button('Add', match: :first).click
    click_link "My Cart"
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text 'My Cart (1)', count: 1
  end
end