require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  category = Category.find_or_create_by name: 'Clothes'

  describe 'Validations' do
    # validation tests/examples here
    subject { described_class.new(name: "Hoodie", price: 225, quantity: 132, category_id: category.id) }

    it "validates: product" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:category) }

    it "validates: name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "validates: price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "validates: quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "validates: category" do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end

  end
end
