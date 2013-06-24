# == Schema Information
#
# Table name: jtests
#
#  id         :integer          not null, primary key
#  dtest_id   :integer
#  student_id :integer
#  begin_time :time
#  end_time   :time
#  ball       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Jtest do
  pending "add some examples to (or delete) #{__FILE__}"
end
