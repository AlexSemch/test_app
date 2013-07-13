# == Schema Information
#
# Table name: dtests
#
#  id         :integer          not null, primary key
#  test_name  :text
#  count_test :integer          default(20)
#  time_exec  :integer          default(20)
#  test_descr :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dthem_id   :integer
#

require 'spec_helper'

describe Dtest do
  pending "add some examples to (or delete) #{__FILE__}"
end
