class ScenariosController < ApplicationController
  
  in_place_edit_for :scenario,  :name
  in_place_edit_for :scenario,  :show_scenario_id
  in_place_edit_for :scenario,  :image_url
  
  def index
    @scenarios = Scenario.combo_search(params.merge({:order=>"created_at desc"})) || Scenario.all
  end
  
  def new
    @scenario = Scenario.new
  end
  
  def create
    # @item_group = ItemGroup.find_by_id(params[:scenario][:item_group_id])
    flash[:notice] = Scenario.create(params[:scenario]) ? "Success" : "Fail"
    redirect_to scenarios_path
  end
  
  def destroy
    flash[:notice] = Scenario.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to scenarios_path
  end
  
  def show
    @item_group = ItemGroup.find_by_id(params[:id])
    @scenarios = Scenario.all
  end
  
  
end
