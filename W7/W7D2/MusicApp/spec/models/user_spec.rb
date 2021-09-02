require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "kzhang69@yahoo.com",
      password: "password123")
  end

  it {should validate_presence_of(:email) }
  it {should validate_presence_of(:password_digest) }
  it {should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "checks if password is correct" do
      expect(user.is_password?("password123")).to be true
    end

    it "checks if password is not correct" do
      expect(user.is_password?("password69")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do

  end
end
