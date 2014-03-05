require 'spec_helper'

describe ItemsController do
  before(:each) do
    @course_package = Factory(:course_package)
    @item_group = Factory(:item_group,:course_package => @course_package)
    @item = Factory(:item,:item_group => @item_group)
  end

  it "should create the item for item_group when group_id is not null" do
    post  :create,  :group_id => @item_group.id,  :lesson => {2 => true,3 => true}
    response.should redirect_to course_package_path(@course_package)
  end
  
  
  it "should delete one item from item_group" do
    delete :destroy,  :group_id => @item_group.id,  :id => @item.id
    response.should redirect_to course_package_path(@course_package)
  end

end
