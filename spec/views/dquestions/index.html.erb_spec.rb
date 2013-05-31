require 'spec_helper'

describe "dquestions/index" do
  before(:each) do
    assign(:dquestions, [
      stub_model(Dquestion,
        :question_text => "MyText",
        :count_answer => 1,
        :dtest_id => "Dtest"
      ),
      stub_model(Dquestion,
        :question_text => "MyText",
        :count_answer => 1,
        :dtest_id => "Dtest"
      )
    ])
  end

  it "renders a list of dquestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Dtest".to_s, :count => 2
  end
end
