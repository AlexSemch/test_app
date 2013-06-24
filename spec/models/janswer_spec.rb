# == Schema Information
#
# Table name: janswers
#
#  id           :integer          not null, primary key
#  jquestion_id :integer
#  danswer_id   :integer
#  truanswer    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Janswer do
  pending "add some examples to (or delete) #{__FILE__}"
end
