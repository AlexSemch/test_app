# == Schema Information
#
# Table name: danswers
#
#  id           :integer          not null, primary key
#  dquestion_id :integer
#  answer_text  :text
#  ans_is_true  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Danswer do
  pending "add some examples to (or delete) #{__FILE__}"
end
