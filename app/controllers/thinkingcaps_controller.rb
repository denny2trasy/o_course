class ThinkingcapsController < ApplicationController
  in_place_edit_for :thinkingcap,  :name
  in_place_edit_for :thinkingcap,  :show_course_id
  in_place_edit_for :thinkingcap,  :image_url
  
  def index
    @thinkingcaps = Thinkingcap.combo_search(params.merge({:order=>"created_at desc"})) || Scenario.all
  end
  
  def new
    @thinkingcap = Thinkingcap.new
  end
  
  def create
    flash[:notice] = Thinkingcap.create(params[:thinkingcap]) ? "Success" : "Fail"
    redirect_to thinkingcaps_path
  end
  
  def destroy
    flash[:notice] = Thinkingcap.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to thinkingcaps_path
  end
  
  def show
    @item_group = ItemGroup.find_by_id(params[:id])
    @thinkingcaps = Thinkingcap.all
  end
  
end
