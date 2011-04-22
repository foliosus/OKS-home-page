require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  context "with a member" do
    setup do
      @member = Factory.create(:member)
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:members)
      assert_select 'tbody tr', assigns(:members).length, "Each member should have one row in the table"
    end

    should "show member" do
      get :show, :id => @member.to_param
      assert_response :success
    end

    should "get edit" do
      get :edit, :id => @member.to_param
      assert_response :success
    end

    should "update member" do
      put :update, :id => @member.to_param, :member => @member.attributes
      assert_redirected_to member_path(assigns(:member))
    end

    should "destroy member" do
      assert_difference('Member.count', -1) do
        delete :destroy, :id => @member.to_param
      end

      assert_redirected_to members_path
    end
  end

  should "get new" do
    get :new
    assert_response :success
  end

  should "create member" do
    assert_difference('Member.count') do
      post :create, :member => Factory.attributes_for(:member)
    end

    assert_redirected_to member_path(assigns(:member))
  end
end
