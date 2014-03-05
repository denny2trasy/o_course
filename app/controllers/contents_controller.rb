class ContentsController < ApplicationController
  before_filter :get_item_group

  private 
  def get_item_group
    @item_group = ItemGroup.find_by_id(params[:item_group_id])
  end
end