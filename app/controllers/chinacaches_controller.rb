class ChinacachesController < ApplicationController
  in_place_edit_for :chinacache,  :name
  in_place_edit_for :chinacache,  :show_course_id
  in_place_edit_for :chinacache,  :image_url
  
  def index
    @chinacaches = Chinacache.combo_search(params.merge({:order=>"created_at desc"})) || Scenario.all
  end
  
  def new
    @chinacache = Chinacache.new
  end
  
  def create
    flash[:notice] = Chinacache.create(params[:chinacache]) ? "Success" : "Fail"
    redirect_to chinacaches_path
  end
  
  def destroy
    flash[:notice] = Chinacache.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to chinacaches_path
  end
  
  def show
    @item_group = ItemGroup.find_by_id(params[:id])
    @chinacaches = Chinacache.all
  end
  
end
