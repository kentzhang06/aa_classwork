require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validates username" do
    it {should validate_presence_of(:username)}
  end

  describe "Validates password_digest" do
    it {should validate_presence_of(:password_digest)}
  end

  describe "Validates presence and length of password" do
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "Validates uniqueness of username" do
    subject(:Kent) {FactoryBot.create(:user)}
    it {should validate_uniqueness_of(:username)}
  end

  describe "#password=" do
    it 'does not save passwords to the DB' do
      FactoryBot.create(:user, username: 'Capy2')

      user = User.find_by(username: 'Capy2')
      expect(user.password).not_to eq('password')
      expect(user.password_digest).not_to eq('password')
    end

    it 'encrypts our password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      FactoryBot.build(:user, password: 'abcdef')
    end
  end

  describe "#is_password?" do
  
    it 'should return true if password is correct' do
      user = User.new(username: 'Snigdha', password: 'password100')
      expect(user.is_password?('password100')).to be(true)
      user = User.create(username: 'Snigdha', password: 'password100')
      
    end

    it 'should return false if password is incorrect' do
      user = User.new(username: 'Snigdha', password: 'password100')
      expect(user.is_password?('password99')).to be(false)
      user = User.create(username: 'Snigdha', password: 'password100')
    end
  end

  describe "Validates presence of session token" do
    it { should validate_presence_of(:session_token) }
  end

  describe "::find_by_credentials" do
    it 'should return user if user is found and password is correct' do
      FactoryBot.create(:user, username: 'Kenty', password: 'password0000')
      user = User.find_by(username: 'Kenty')
      expect(User.find_by_credentials('Kenty', 'password0000')).to eq(user)
    end

    it 'should return nil if user not found or password is incorrect' do
      user = User.find_by(username: 'Snigdy')
      expect(User.find_by_credentials('Snigdy', 'pw9999999')).to eq(user)
    end
  end

end
