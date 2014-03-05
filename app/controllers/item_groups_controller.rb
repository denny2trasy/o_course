class ItemGroupsController < ApplicationController
    
  def new
    @item_group = ItemGroup.new(:course_package_id => params[:course_package_id])
  end
  
  def create
    flash[:notice] = ItemGroup.create(params[:item_group]) ? "Success" : "Fail"
    redirect_to course_package_path(:id => params[:item_group][:course_package_id],:item => "item_groups")
  end
  
  def destroy
    flash[:notice] = ItemGroup.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to course_package_path(:id => params[:course_package_id], :item => "item_groups")
  end
    
end
