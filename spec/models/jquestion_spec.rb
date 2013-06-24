# == Schema Information
#
# Table name: jquestions
#
#  id           :integer          not null, primary key
#  jtest_id     :integer
#  dquestion_id :integer
#  truanswer    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Jquestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
