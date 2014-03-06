require 'spec_helper'
describe "sign_up page" do
  it "displays the sign up page" do
    get "/signup_path"
    expect(page).tohave_content('Sign Up')
  end
end

describe "home page" do
  it "displays the user's username after successful login" do
    user = User.create!(:username => "ada", :password => "secret")
    get "/login"
    assert_select "form.login" do
      assert_select "input[name=?]", "username"
      assert_select "input[name=?]", "password"
      assert_select "input[type=?]", "submit"
    end

    post "/login", :username => "ada", :password => "secret"
    assert_select ".header .username", :text => "ada"
  end
end