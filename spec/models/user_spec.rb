require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:api_key)}
    it {should validate_uniqueness_of(:api_key)}
  end

  describe 'generate_random_key' do
    it 'generates random api key for user' do
      api_key = User.generate_random_key
      
      expect(api_key).to be_a(Integer)
      expect(api_key.to_s.length).to eq(15)
    end
  end
end