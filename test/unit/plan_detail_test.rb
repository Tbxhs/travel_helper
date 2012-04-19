# == Schema Information
#
# Table name: plan_details
#
#  id          :integer(4)      not null, primary key
#  type        :string(255)
#  from_city   :string(255)
#  to_city     :string(255)
#  go_time     :date
#  arrive_time :date
#  price       :integer(4)
#  hotel_name  :string(255)
#  note        :string(255)
#  zoufa       :text
#  plan_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class PlanDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
