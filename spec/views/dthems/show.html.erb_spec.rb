require 'spec_helper'

describe "dthems/show" do
  before(:each) do
    @dthem = assign(:dthem, stub_model(Dthem,
      :class_st => 1,
      :them_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
