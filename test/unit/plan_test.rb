# == Schema Information
#
# Table name: plans
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  username    :string(255)
#  digg        :integer(4)
#  connect     :string(255)
#  password    :string(255)
#  gonglue_url :string(255)
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
