require 'spec_helper'

describe "dteors/show" do
  before(:each) do
    @dteor = assign(:dteor, stub_model(Dteor,
      :name => "Name",
      :teor_text => "MyText",
      :dthem_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
