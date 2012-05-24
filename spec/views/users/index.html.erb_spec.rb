require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "Username",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :points => 1
      ),
      stub_model(User,
        :username => "Username",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :points => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
