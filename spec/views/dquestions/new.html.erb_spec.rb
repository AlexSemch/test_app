require 'spec_helper'

describe "dquestions/new" do
  before(:each) do
    assign(:dquestion, stub_model(Dquestion,
      :question_text => "MyText",
      :count_answer => 1,
      :dtest_id => "MyString"
    ).as_new_record)
  end

  it "renders new dquestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dquestions_path, :method => "post" do
      assert_select "textarea#dquestion_question_text", :name => "dquestion[question_text]"
      assert_select "input#dquestion_count_answer", :name => "dquestion[count_answer]"
      assert_select "input#dquestion_dtest_id", :name => "dquestion[dtest_id]"
    end
  end
end
