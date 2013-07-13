require 'spec_helper'

describe "dteors/new" do
  before(:each) do
    assign(:dteor, stub_model(Dteor,
      :name => "MyString",
      :teor_text => "MyText",
      :dthem_id => 1
    ).as_new_record)
  end

  it "renders new dteor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dteors_path, :method => "post" do
      assert_select "input#dteor_name", :name => "dteor[name]"
      assert_select "textarea#dteor_teor_text", :name => "dteor[teor_text]"
      assert_select "input#dteor_dthem_id", :name => "dteor[dthem_id]"
    end
  end
end
