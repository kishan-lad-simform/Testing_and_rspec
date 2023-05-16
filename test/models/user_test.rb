require "test_helper"

class UserTest < ActiveSupport::TestCase
 setup do
    @test_user =  User.new(email: "abc@gmail.com", password: "qwerty")
    @test_user.save if assert @test_user.valid?
    @current_user = @test_user
  end

  test 'check email is present' do
    assert_not_nil @current_user, message: "User is not present" 
  end
  
end

