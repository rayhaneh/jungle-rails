require 'rails_helper'

RSpec.describe Product, type: :model do

  # Validations with shoulda/Matcher
  # context "Validations:" do

  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:price) }
  #   it { is_expected.to validate_presence_of(:quantity) }
  #   it { is_expected.to validate_presence_of(:category) }

  # end

  # Validations without shoulda/matcher
  context "Validations:" do

    before :each do
      @category        = Category.create name: 'TestCat'
      @product_details = {
          name:  'Test Product Name',
          quantity: 10,
          price: 64.99
      }
    end

    it "Should assign correct product details" do
      @product = @category.products.new(@product_details)
      expect(@product.valid?).to be true
    end

    it "Should errorout with a nil name field" do
      @product_details[:name] = nil
      @product = @category.products.new(@product_details)
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "Should errorout with a nil price field" do
      @product_details[:price] = nil
      @product = @category.products.new(@product_details)
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "Should errorout with a nil quantity field" do
      @product_details[:quantity] = nil
      @product = @category.products.new(@product_details)
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "Should errorout with a nil category field" do
      @product_details[:category] = nil
      @product = @category.products.new(@product_details)
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end


  end

end
