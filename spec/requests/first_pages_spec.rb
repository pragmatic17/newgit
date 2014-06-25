require 'spec_helper'

describe "FirstPages" do
  describe "home" do
    it "should have content 'Home'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get first_pages_index_path
      response.status.should be(200)
    end
  end
end
