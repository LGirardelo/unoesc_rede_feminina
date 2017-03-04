require 'test_helper'

class QuestionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questionario = questionarios(:one)
  end

  test "should get index" do
    get questionarios_url
    assert_response :success
  end

  test "should get new" do
    get new_questionario_url
    assert_response :success
  end

  test "should create questionario" do
    assert_difference('Questionario.count') do
      post questionarios_url, params: { questionario: { descricao: @questionario.descricao } }
    end

    assert_redirected_to questionario_url(Questionario.last)
  end

  test "should show questionario" do
    get questionario_url(@questionario)
    assert_response :success
  end

  test "should get edit" do
    get edit_questionario_url(@questionario)
    assert_response :success
  end

  test "should update questionario" do
    patch questionario_url(@questionario), params: { questionario: { descricao: @questionario.descricao } }
    assert_redirected_to questionario_url(@questionario)
  end

  test "should destroy questionario" do
    assert_difference('Questionario.count', -1) do
      delete questionario_url(@questionario)
    end

    assert_redirected_to questionarios_url
  end
end
