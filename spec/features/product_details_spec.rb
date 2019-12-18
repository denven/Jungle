require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'  
    
      5.times do |n|
        image_name = 'apparel' << (n+1).to_s << ".jpg"
        @category.products.create!(
          name:  Faker::Hipster.sentence(1),
          description: Faker::Hipster.paragraph(20),
          image: open_asset(image_name),
          quantity: 10,
          price: 64.99
          )
      end
  
    end

  scenario "They see all products in detail" do
    # ACT
    # visit '/categories/1'
    # save_screenshot

    5.times do |n|
      visit '/categories/1'

      href_path = '/products/' << (n+1).to_s
      visit href_path

      # The find_link of hrefs works but the el.click doen't click the href
      # el = page.find_link 'Details »', href: href_path
      # puts el.text
      # el.click

      # DEBUG
      save_screenshot
      # VERIFY
      expect(page).to have_text @category.products[n][:description]
    end
  end

end
