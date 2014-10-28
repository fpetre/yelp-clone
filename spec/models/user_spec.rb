require 'spec_helper'
require 'factory_girl'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "is invalid without a username" do
    expect(FactoryGirl.build(:user, :username => "")).to_not be_valid
  end
  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, :password => "")).to_not be_valid
  end
  it "is invalid with a password shorter than 6 chars" do
     expect(FactoryGirl.build(:user, :password => Faker::Internet.password(3))).to_not be_valid
  end

  it "creates a hashed password when created" do
    expect(FactoryGirl.create(:user).password_digest).to_not be_nil
  end

  it "creates a session token when created" do
    expect(FactoryGirl.create(:user).session_token).to_not be_nil
  end

end