require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validations:" do

    before :each do
      @user_details = {
          name:  'John',
          email: 'JOHN.smith@gmail.com',
          password: 'mypassword',
          password_confirmation: 'mypassword'
      }
    end

    it "should save a valid user" do
      @user = User.create(@user_details)
      expect(@user.valid?).to be true
      @user.save
      expect(@user.errors.full_messages).to be_empty
    end

    it "should errorout with a nil name field" do
      @user_details[:name] = nil
      @user = User.new(@user_details)
      @user.save
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it "should errorout with a nil email field" do
      @user_details[:email] = nil
      @user = User.new(@user_details)
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "should errorout with a nil password field" do
      @user_details[:password] = nil
      @user = User.new(@user_details)
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "should errorout with a nil password confirmation field" do
      @user_details[:password_confirmation] = nil
      @user = User.new(@user_details)
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it "should errorout with different password and password confirmation fields" do
      @user_details[:password_confirmation] = 'newpassword'
      @user = User.new(@user_details)
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "should errorout with duplicate email" do
      @user1 = User.new(@user_details)
      @user1.save
      @user2 = User.new(@user_details)
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "should have a case insensitive email" do
      @user1 = User.new(@user_details)
      @user1.save
      @user_details[:email] = @user_details[:email].upcase
      @user2 = User.new(@user_details)
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
   end

  end

end






