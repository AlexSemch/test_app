# == Schema Information
#
# Table name: peoples
#
#  id         :integer          not null, primary key
#  pip        :string(255)
#  birth_date :date
#  classchol  :string(255)
#  is_teacher :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe People do
  pending "add some examples to (or delete) #{__FILE__}"
end
