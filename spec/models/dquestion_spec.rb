# == Schema Information
#
# Table name: dquestions
#
#  id            :integer          not null, primary key
#  question_text :text
#  count_answer  :integer          default(4)
#  dtest_id      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Dquestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
