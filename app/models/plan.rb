# == Schema Information
#
# Table name: plans
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)     计划名称
#  username    :string(255)     用户名
#  connect     :string(255)     联系方式-
#  password    :string(255)     浏览密码
#  gonglue_url :string(255)     所属的攻略地址，方便穷游及马蜂窝的用户-
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :plan_details, dependent: :destroy 
  attr_protected :user_id
  
  validates :title, :presence => true
end
