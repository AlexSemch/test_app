require 'spec_helper'

describe "dtests/show" do
  before(:each) do
    @dtest = assign(:dtest, stub_model(Dtest,
      :test_name => "MyText",
      :count_test => 1,
      :time_exec => 2,
      :test_descr => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
