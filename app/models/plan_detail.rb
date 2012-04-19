# == Schema Information
#
# Table name: plan_details
#
#  id          :integer(4)      not null, primary key
#  type        :string(255)     存储类型：飞机，住，吃，路线安排
#  from_city   :string(255)     起飞城市
#  to_city     :string(255)     抵达城市
#  go_time     :date            起飞时间/入住时间
#  arrive_time :date            到达时间/离店时间
#  price       :integer(4)      价格
#  hotel_name  :string(255)     酒店名称
#  note        :string(255)     备注，限制150个字符，需要精华
#  zoufa       :text            具体走法，如怎样到达酒店
#  plan_id     :integer(4)      
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class PlanDetail < ActiveRecord::Base
  attr_protected :type
  
  belongs_to :plan
  

end
