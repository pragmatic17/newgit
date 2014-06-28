require 'spec_helper'

describe User do
  before do
  	@user = User.new(name: "Example_User", email:"user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject {@user}

  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
end
