require 'spec_helper'

describe "danswers/index" do
  before(:each) do
    assign(:danswers, [
      stub_model(Danswer,
        :dquestion_id => 1,
        :answer_text => "MyText",
        :ans_is_true => false
      ),
      stub_model(Danswer,
        :dquestion_id => 1,
        :answer_text => "MyText",
        :ans_is_true => false
      )
    ])
  end

  it "renders a list of danswers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
