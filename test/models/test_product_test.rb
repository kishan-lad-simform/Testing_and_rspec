require "test_helper"

class TestProductTest < ActiveSupport::TestCase
  setup do
    @test_record1 = TestProduct.new( product_name: "Test1", description: "asd", price: 10, user_id: 1 )
  end

  test 'product should not be valid' do
    test_record = TestProduct.new( product_name: "Test1", description: "asd", price: "asd" )
    assert_not test_record.valid?
    puts "#{test_record.errors.full_messages}"
  end

  test 'do not save the record' do
    #user have to be present in db but it isn't now.
    assert_not @test_record1.save
  end


  test 'checking price is valid or not' do
    puts "It is valid." if @test_record1.price?
  end

end
