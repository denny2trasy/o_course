class SessionCreditsController < ApplicationController
  
  def new
    @session_credit = SessionCredit.new(:course_package_id => params[:course_package_id])
  end
  
  def create
    flash[:notice] = SessionCredit.create(params[:session_credit]) ? "Success" : "Fail"
    redirect_to course_package_path(:id => params[:session_credit][:course_package_id],:item => "session_credits")
  end  
  
  def destroy
    flash[:notice] = SessionCredit.find_by_id(params[:id]).destroy ? "Success" : "Fail"
    redirect_to course_package_path(:id => params[:course_package_id],:item => "session_credits")
  end
  
end
