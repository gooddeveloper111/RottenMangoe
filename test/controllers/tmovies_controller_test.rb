require 'test_helper'

class TmoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tmovies_index_url
    assert_response :success
  end

  test "should get show" do
    get tmovies_show_url
    assert_response :success
  end

  test "should get new" do
    get tmovies_new_url
    assert_response :success
  end

  test "should get edit" do
    get tmovies_edit_url
    assert_response :success
  end

end
