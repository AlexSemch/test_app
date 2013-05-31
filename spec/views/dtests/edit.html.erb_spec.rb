require 'spec_helper'

describe "dtests/edit" do
  before(:each) do
    @dtest = assign(:dtest, stub_model(Dtest,
      :test_name => "MyText",
      :count_test => 1,
      :time_exec => 1,
      :test_descr => "MyText"
    ))
  end

  it "renders the edit dtest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dtests_path(@dtest), :method => "post" do
      assert_select "textarea#dtest_test_name", :name => "dtest[test_name]"
      assert_select "input#dtest_count_test", :name => "dtest[count_test]"
      assert_select "input#dtest_time_exec", :name => "dtest[time_exec]"
      assert_select "textarea#dtest_test_descr", :name => "dtest[test_descr]"
    end
  end
end
