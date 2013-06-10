require 'spec_helper'

describe "danswers/show" do
  before(:each) do
    @danswer = assign(:danswer, stub_model(Danswer,
      :dquestion_id => 1,
      :answer_text => "MyText",
      :ans_is_true => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
