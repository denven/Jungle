require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  user = User.create(first_name: "Hans", last_name: "Ng", email: "test@test.com", password: "123", password_confirmation: "123")

  describe 'Validations' do
    # validation examples here
    subject { described_class.new(first_name: "Hans", last_name: "Ng", email: "123@test.com", password: "123", password_confirmation: "123") }

    it "validates: user" do
      expect(subject).to be_valid
    end

    it "validates: password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "validates: password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "validates: password matches" do
      subject.password ="123"
      subject.password_confirmation = "1234"
      expect(subject).to_not be_valid
    end

    it "validates: email in-casesensitive" do
      subject.email = "tEst@TEST.COM"
      expect(subject).to_not be_valid
    end

    it "validates: minimum password length 3 digits" do
      subject.password = "12"
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end


end
