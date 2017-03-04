require 'test_helper'

class TiposervicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiposervico = tiposervicos(:one)
  end

  test "should get index" do
    get tiposervicos_url
    assert_response :success
  end

  test "should get new" do
    get new_tiposervico_url
    assert_response :success
  end

  test "should create tiposervico" do
    assert_difference('Tiposervico.count') do
      post tiposervicos_url, params: { tiposervico: { descricao: @tiposervico.descricao } }
    end

    assert_redirected_to tiposervico_url(Tiposervico.last)
  end

  test "should show tiposervico" do
    get tiposervico_url(@tiposervico)
    assert_response :success
  end

  test "should get edit" do
    get edit_tiposervico_url(@tiposervico)
    assert_response :success
  end

  test "should update tiposervico" do
    patch tiposervico_url(@tiposervico), params: { tiposervico: { descricao: @tiposervico.descricao } }
    assert_redirected_to tiposervico_url(@tiposervico)
  end

  test "should destroy tiposervico" do
    assert_difference('Tiposervico.count', -1) do
      delete tiposervico_url(@tiposervico)
    end

    assert_redirected_to tiposervicos_url
  end
end
