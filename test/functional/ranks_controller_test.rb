require 'test_helper'

class RanksControllerTest < ActionController::TestCase
  [AikidoRank, KiRank].each do |rank_class|
    context "with a #{rank_class}" do
      setup do
        @rank_string = rank_class.to_s
        @rank_symbol = @rank_string.underscore.to_sym
        @rank = Factory.create(@rank_symbol)
      end

      should "get index" do
        get :index, :type => @rank_string
        assert_response :success
        assert_equal([@rank], assigns(:ranks))
      end

      should "get edit" do
        get :edit, :type => @rank_string, :id => @rank.to_param
        assert_response :success
      end

      should "update rank" do
        put :update, :type => @rank_string, :id => @rank.to_param, :rank => @rank.attributes
        assert_redirected_to send("#{@rank_symbol}s_path")
      end

      should "destroy rank" do
        assert_difference("#{rank_class}.count", -1) do
          delete :destroy, :type => @rank_string, :id => @rank.to_param
        end
        assert flash[:info]
        assert_redirected_to send("#{@rank_symbol}s_path")
      end
      
      should "get new #{rank_class}" do
        get :new, :type => @rank_string
        assert_response :success
        assert_select 'h1', :text => "New #{@rank_string.underscore.split('_').first.capitalize} rank"
      end

      should "create #{rank_class}" do
        assert_difference("#{rank_class}.count") do
          attribs = Factory.attributes_for(@rank_symbol)
          post :create, :type => @rank_string, :rank => attribs
        end

        assert_redirected_to send("#{@rank_symbol}s_path")
      end
    end
  end
end
