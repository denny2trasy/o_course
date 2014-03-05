class ThirdContentsController < ContentsController
  
  def new
    @third_content = @item_group.third_contents.new
  end
  
  def create
    @item_group = ItemGroup.find_by_id(params[:third_content][:item_group_id])
    flash[:notice] = ThirdContent.create(params[:third_content]) ? "Success" : "Fail"
    redirect_to course_package_path(@item_group.course_package)
  end
  
end
