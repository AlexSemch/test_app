require 'spec_helper'

describe "dthems/index" do
  before(:each) do
    assign(:dthems, [
      stub_model(Dthem,
        :class_st => 1,
        :them_text => "MyText"
      ),
      stub_model(Dthem,
        :class_st => 1,
        :them_text => "MyText"
      )
    ])
  end

  it "renders a list of dthems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
