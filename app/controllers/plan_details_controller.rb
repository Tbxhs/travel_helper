# coding: utf-8
class PlanDetailsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @plan = Plan.find(params[:plan_id])
    @plan_details = @plan.plan_details.build
  end

  def create
    @plan = Plan.find(params[:plan_id])
        
    params[:plan_detail_air].each do |i, values|
      u = PlanDetail.new(values)
      u.plan_id = @plan.id
      u.plan_type = "air"      
      u.save if the_row_not_null(values)
    end
    
    params[:plan_detail_hotel].each do |i, values|
      u = PlanDetail.new(values)
      u.plan_id = @plan.id
      u.plan_type = "hotel"
      u.save if the_row_not_null(values)
    end
    
    params[:plan_detail_way].each do |i, values|
      u = PlanDetail.new(values)
      u.plan_id = @plan.id
      u.plan_type = "way"
      u.save if the_row_not_null(values)
    end
    
    update_total_price(@plan)
    
    redirect_to plan_path(@plan)
    
  end
  
  def edit
    @detail = PlanDetail.find(params[:id])
    render layout:false
  end

  def update
    detail = PlanDetail.find(params[:id])
    
    if detail.update_attributes(params[:plan_detail])
      plan = Plan.find(detail.plan_id)
      update_total_price(plan)
      
      flash[:success] = "修改成功"
      redirect_to plan_path(detail.plan_id)
    end
  end

  def destroy
    PlanDetail.find(params[:id]).destroy
    flash[:success] = "删除成功."
    redirect_to :back
  end

private

  def the_row_not_null(values)
    num = 0
    
    values.each do |v,value|
      unless value.blank?
        num += 1
      end
      
      if num == 0
        return false
      end
    end
  end
  
  def update_total_price(plan)
    @plan = plan
    @total_price = @plan.plan_details.sum(:price).to_f
    @plan.update_attributes(price:@total_price)
  end
  
end
