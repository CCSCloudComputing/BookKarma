require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :password => "Password",
      :salt => "Salt",
      :points => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Password/)
    rendered.should match(/Salt/)
    rendered.should match(/1/)
  end
end
