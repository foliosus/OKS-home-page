require 'test_helper'

class RanksControllerTest < ActionController::TestCase
  Rank.descendants.collect(&:to_s).each do |rank_type|
    context "with a #{rank_type}" do
      setup do
        Factory.create(:rank, :type => rank_type)
        @rank = Rank.last
      end

      should "get index" do
        get :index
        assert_response :success
        assert_equal({@rank.class.to_s => [@rank]}, assigns(:ranks))
      end

      should "get edit" do
        get :edit, :id => @rank.to_param
        assert_response :success
      end

      should "update rank" do
        put :update, :id => @rank.to_param, :rank => @rank.attributes
        assert_redirected_to ranks_path
      end

      should "destroy rank" do
        assert_difference('Rank.count', -1) do
          delete :destroy, :id => @rank.to_param
        end
        assert flash[:info]
        assert_redirected_to ranks_path
      end
    end

    should "get new #{rank_type}" do
      get :new, :rank => {:type => rank_type}
      assert_response :success
      assert_select 'h1', :text => "New #{rank_type.sub('Rank','')} rank"
    end

    should "create #{rank_type}" do
      assert_difference("#{rank_type}.count") do
        attribs = Factory.attributes_for(:rank, :type => rank_type)
        post :create, :rank => attribs
      end

      assert_redirected_to ranks_path
    end
  end
end
