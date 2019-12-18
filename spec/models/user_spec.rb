require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  User.create(first_name: "Hans", last_name: "Ng", email: "test@test.com", password: "12345", password_confirmation: "12345")
  user = User.find_by_email("test@test.com");  # This is needed because we don't require database cleaner right now

  describe 'Validations' do
    # validation examples here
    subject { described_class.new(first_name: "Hans", last_name: "Ng", email: "123@test.com", password: "12345", password_confirmation: "12345") }

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
    it "validates: authentication by email and password" do
      cur_user = User.authenticate_with_credentials("test@test.com", "12345")
      expect(cur_user).to eq(user)
    end

    it "validates: authentication by email with space and password" do
      cur_user = User.authenticate_with_credentials("test@test.com ", "12345")
      expect(cur_user).to eq(user)
    end

    it "validates: authentication of insensitive email and password" do
      cur_user = User.authenticate_with_credentials("tEst@test.COm", "12345")
      expect(cur_user).to eq(user)
    end

  end

end
