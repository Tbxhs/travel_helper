# coding: utf-8
class PlanController < ApplicationController
  before_filter :authenticate_user! , :except => [ :show,:index ]
  
  def index
    @plans = Plan.all
  end
  
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params[:plan])
    @plan.username = current_user.username
    @plan.user_id = current_user.id

    if @plan.save
      redirect_to new_plan_plan_detail_path(@plan)
    else
      render 'new'
    end
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def show
    @plan = Plan.find(params[:id])
    @page_title = @plan.title
    @plan_details = @plan.plan_details
    @total_air_price = @plan_details.where(plan_type: "air").sum(:price).to_f
    @total_hotel_price = @plan_details.where(plan_type: "hotel").sum(:price).to_f
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(params[:plan])
      flash[:success] = "更新成功."
      redirect_to plan_path(@plan)
    end
  end

  def destroy
    Plan.find(params[:id]).destroy
    flash[:success] = "删除成功."
    redirect_to my_path
  end
  
end
