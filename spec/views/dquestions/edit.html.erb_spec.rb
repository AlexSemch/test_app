require 'spec_helper'

describe "dquestions/edit" do
  before(:each) do
    @dquestion = assign(:dquestion, stub_model(Dquestion,
      :question_text => "MyText",
      :count_answer => 1,
      :dtest_id => "MyString"
    ))
  end

  it "renders the edit dquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dquestions_path(@dquestion), :method => "post" do
      assert_select "textarea#dquestion_question_text", :name => "dquestion[question_text]"
      assert_select "input#dquestion_count_answer", :name => "dquestion[count_answer]"
      assert_select "input#dquestion_dtest_id", :name => "dquestion[dtest_id]"
    end
  end
end
