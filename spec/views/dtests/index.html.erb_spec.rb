require 'spec_helper'

describe "dtests/index" do
  before(:each) do
    assign(:dtests, [
      stub_model(Dtest,
        :test_name => "MyText",
        :count_test => 1,
        :time_exec => 2,
        :test_descr => "MyText"
      ),
      stub_model(Dtest,
        :test_name => "MyText",
        :count_test => 1,
        :time_exec => 2,
        :test_descr => "MyText"
      )
    ])
  end

  it "renders a list of dtests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
