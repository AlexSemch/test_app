require 'spec_helper'

describe "danswers/new" do
  before(:each) do
    assign(:danswer, stub_model(Danswer,
      :dquestion_id => 1,
      :answer_text => "MyText",
      :ans_is_true => false
    ).as_new_record)
  end

  it "renders new danswer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => danswers_path, :method => "post" do
      assert_select "input#danswer_dquestion_id", :name => "danswer[dquestion_id]"
      assert_select "textarea#danswer_answer_text", :name => "danswer[answer_text]"
      assert_select "input#danswer_ans_is_true", :name => "danswer[ans_is_true]"
    end
  end
end
