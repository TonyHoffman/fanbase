module CategoriesHelper
  
  def makeContestCategory
    @category = Category.find(params[:category])
    @contest.find(params[:contest_id])
    # @contest.category = @category
    @contest = @category.contests.build(@contest)
    # @category.save
    
    respond_to do |format|
       if @category.update_attributes(params[:category])
         format.html { redirect_to @category, notice: 'makeContestCategory was successfully run.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @category.errors, status: :unprocessable_entity }
       end
     end
  end
  
  def category_display
    if (@category.level1 == 'Touchdown') 
      Category::FOOTBALLCATEGORYCHOICES
    else
      Category::HOCKEYCATEGORYCHOICES
    end
  end
  
  
  
end


 # some guy says this works
 # <%= form_for [@project, @task], :url => cancel_project_task_path(@project, @task) do |f| %>