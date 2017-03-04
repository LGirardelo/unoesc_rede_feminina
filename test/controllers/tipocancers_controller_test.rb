require 'test_helper'

class TipocancersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipocancer = tipocancers(:one)
  end

  test "should get index" do
    get tipocancers_url
    assert_response :success
  end

  test "should get new" do
    get new_tipocancer_url
    assert_response :success
  end

  test "should create tipocancer" do
    assert_difference('Tipocancer.count') do
      post tipocancers_url, params: { tipocancer: { descricao: @tipocancer.descricao, nivelgravidade: @tipocancer.nivelgravidade } }
    end

    assert_redirected_to tipocancer_url(Tipocancer.last)
  end

  test "should show tipocancer" do
    get tipocancer_url(@tipocancer)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipocancer_url(@tipocancer)
    assert_response :success
  end

  test "should update tipocancer" do
    patch tipocancer_url(@tipocancer), params: { tipocancer: { descricao: @tipocancer.descricao, nivelgravidade: @tipocancer.nivelgravidade } }
    assert_redirected_to tipocancer_url(@tipocancer)
  end

  test "should destroy tipocancer" do
    assert_difference('Tipocancer.count', -1) do
      delete tipocancer_url(@tipocancer)
    end

    assert_redirected_to tipocancers_url
  end
end
