require 'spec_helper'

describe "dthems/edit" do
  before(:each) do
    @dthem = assign(:dthem, stub_model(Dthem,
      :class_st => 1,
      :them_text => "MyText"
    ))
  end

  it "renders the edit dthem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dthems_path(@dthem), :method => "post" do
      assert_select "input#dthem_class_st", :name => "dthem[class_st]"
      assert_select "textarea#dthem_them_text", :name => "dthem[them_text]"
    end
  end
end
