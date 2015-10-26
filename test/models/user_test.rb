require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #special rails method to setup test with data
  def setup
    @user = User.new(
    firstname: "Test",
    lastname: "Last",
    email: "terry@example.com",
    password: "123456",
    password_confirmation:"123456")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "firstname should be present" do
    @user.firstname = "  "
    assert_not @user.valid?
  end

  test "lastname should be present" do
    @user.lastname = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "firstname should not be too long" do
    @user.firstname = "a" * 244
    assert_not @user.valid?
  end

  test "lastname should not be too long" do
    @user.lastname = "a" * 244
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.lastname = "a" * 244
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addrs = %w[user@example.com USER@example.com A_US-qi@foo.bar.org]
    valid_addrs.each do |addr|
      @user.email = addr
      assert @user.valid?, "#{addr.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addrs = %w[user@example,com
      USER.example.com
      user@name.
      foo@bar_baz.com
      foo@bar+baz.com]
    invalid_addrs.each do |addr|
      @user.email = addr
      assert_not @user.valid?, "#{addr.inspect} should be invalid"
    end
  end

  test "email should be unique and case-insensitive" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save  #save original now dup should fail
    assert_not duplicate_user.valid?, "user not unique"
  end

  test "email should be saved downcase" do
    @user.email = "myUpperCaseEmail@Example.COM"
    @user.save
    assert @user.email == "myuppercaseemail@example.com"
  end

  test "password should not be blank" do
    @user.password = " " * 6
    assert_not @user.valid?
  end

  test "password should be minimum 6 chars" do
    @user.password = "one"
    assert_not @user.valid?
  end



end
