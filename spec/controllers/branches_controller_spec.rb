require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BranchesController do

  # This should return the minimal set of attributes required to create a valid
  # Branch. As you add validations to Branch, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:contest_id => 1, :user_id => 1}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BranchesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "create a branch that's related to both a contest and user" do
    it "is saved" do
      # @contest = Contest.create!
      # branch = Branch.create! valid_attributes
      
    end
  end


  end




  # describe "this one" do
  #   it "does this" do
  #     branch = Branch.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:branches).should eq([branch])
  #   end
  # end
  # 
  # describe "GET show" do
  #   it "assigns the requested branch as @branch" do
  #     branch = Branch.create! valid_attributes
  #     get :show, {:id => branch.to_param}, valid_session
  #     assigns(:branch).should eq(branch)
  #   end
  # end
  # 
  # describe "GET new" do
  #   it "assigns a new branch as @branch" do
  #     get :new, {}, valid_session
  #     assigns(:branch).should be_a_new(Branch)
  #   end
  # end
  # 
  # describe "GET edit" do
  #   it "assigns the requested branch as @branch" do
  #     branch = Branch.create! valid_attributes
  #     get :edit, {:id => branch.to_param}, valid_session
  #     assigns(:branch).should eq(branch)
  #   end
  # end
  # 
  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Branch" do
  #       expect {
  #         post :create, {:branch => valid_attributes}, valid_session
  #       }.to change(Branch, :count).by(1)
  #     end
  # 
  #     it "assigns a newly created branch as @branch" do
  #       post :create, {:branch => valid_attributes}, valid_session
  #       assigns(:branch).should be_a(Branch)
  #       assigns(:branch).should be_persisted
  #     end
  # 
  #     it "redirects to the created branch" do
  #       post :create, {:branch => valid_attributes}, valid_session
  #       response.should redirect_to(Branch.last)
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved branch as @branch" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Branch.any_instance.stub(:save).and_return(false)
  #       post :create, {:branch => {}}, valid_session
  #       assigns(:branch).should be_a_new(Branch)
  #     end
  # 
  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Branch.any_instance.stub(:save).and_return(false)
  #       post :create, {:branch => {}}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end
  # 
  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested branch" do
  #       branch = Branch.create! valid_attributes
  #       # Assuming there are no other branches in the database, this
  #       # specifies that the Branch created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Branch.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, {:id => branch.to_param, :branch => {'these' => 'params'}}, valid_session
  #     end
  # 
  #     it "assigns the requested branch as @branch" do
  #       branch = Branch.create! valid_attributes
  #       put :update, {:id => branch.to_param, :branch => valid_attributes}, valid_session
  #       assigns(:branch).should eq(branch)
  #     end
  # 
  #     it "redirects to the branch" do
  #       branch = Branch.create! valid_attributes
  #       put :update, {:id => branch.to_param, :branch => valid_attributes}, valid_session
  #       response.should redirect_to(branch)
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns the branch as @branch" do
  #       branch = Branch.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Branch.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => branch.to_param, :branch => {}}, valid_session
  #       assigns(:branch).should eq(branch)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       branch = Branch.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Branch.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => branch.to_param, :branch => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end
  # 
  # describe "DELETE destroy" do
  #   it "destroys the requested branch" do
  #     branch = Branch.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => branch.to_param}, valid_session
  #     }.to change(Branch, :count).by(-1)
  #   end
  # 
  #   it "redirects to the branches list" do
  #     branch = Branch.create! valid_attributes
  #     delete :destroy, {:id => branch.to_param}, valid_session
  #     response.should redirect_to(branches_url)
  #   end
  # end

