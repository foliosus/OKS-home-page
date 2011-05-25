require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    @member = Factory.create :member
    @rank = Factory.create :rank
    @exam = Factory.create(:exam, :member => @member, :rank => @rank)
  end

  should "get index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:exams)
  end

  should "get new with a member id" do
    get :new, :member_id => @member.to_param
    assert_response :success
    assert_template 'new'
    assert_select '#exam_member_id', 1, "Should have a member id field for a new record"
  end
  
  should "not get new exam form without a member id" do
    get :new
    assert_redirected_to members_path
  end
  
  should "create exam" do
    assert_difference('Exam.count') do
      post :create, :exam => @exam.attributes
    end

    assert_redirected_to exams_path
  end

  should "get edit" do
    get :edit, :id => @exam.to_param
    assert_response :success
    assert_template 'edit'
    assert_select '#exam_member_id', 0, "Should not have a member id field for an old record"
  end

  should "update exam" do
    put :update, :id => @exam.to_param, :exam => @exam.attributes
    assert_redirected_to exams_path
  end

  should "destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, :id => @exam.to_param
    end

    assert_redirected_to exams_path
  end
end
