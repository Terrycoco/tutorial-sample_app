require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "should not create user if invalid" do
    #go to signup page
    get signup_path
    #user count will not increase
    assert_no_difference 'User.count' do
      #after this data is posted
      post users_path, user: {firstname: "",
                              lastname: "",
                              email: "user@invalid",
                              password: "foo",
                              password_confirmation: "bar"}
    end
    #signup page should now show
    assert_template 'users/new'
  end

  test "should create a valid user" do
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {firstname: "John",
                              lastname: "Elton",
                              email: "user@valid.com",
                              password: "foobar",
                              password_confirmation: "foobar"}
    end
    assert_template 'users/show'
  end
end
