# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  first_name    :string(255)
#  name          :string(255)
#  second_name   :string(255)
#  birth_date    :date
#  class_st      :integer
#  is_teacher    :boolean          default(FALSE)
#  count_of_test :integer
#  round_ball    :float
#  descr_st      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Student do
  pending "add some examples to (or delete) #{__FILE__}"
end
