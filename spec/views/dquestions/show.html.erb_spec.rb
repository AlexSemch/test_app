require 'spec_helper'

describe "dquestions/show" do
  before(:each) do
    @dquestion = assign(:dquestion, stub_model(Dquestion,
      :question_text => "MyText",
      :count_answer => 1,
      :dtest_id => "Dtest"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Dtest/)
  end
end
