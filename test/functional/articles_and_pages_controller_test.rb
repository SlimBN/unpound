require 'test_helper'

class ArticlesAndPagesControllerTest < ActionController::TestCase
  setup do
    @articles_and_page = articles_and_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles_and_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create articles_and_page" do
    assert_difference('ArticlesAndPage.count') do
      post :create, articles_and_page: { article_id: @articles_and_page.article_id, page_id: @articles_and_page.page_id, style: @articles_and_page.style, user_id: @articles_and_page.user_id }
    end

    assert_redirected_to articles_and_page_path(assigns(:articles_and_page))
  end

  test "should show articles_and_page" do
    get :show, id: @articles_and_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @articles_and_page
    assert_response :success
  end

  test "should update articles_and_page" do
    put :update, id: @articles_and_page, articles_and_page: { article_id: @articles_and_page.article_id, page_id: @articles_and_page.page_id, style: @articles_and_page.style, user_id: @articles_and_page.user_id }
    assert_redirected_to articles_and_page_path(assigns(:articles_and_page))
  end

  test "should destroy articles_and_page" do
    assert_difference('ArticlesAndPage.count', -1) do
      delete :destroy, id: @articles_and_page
    end

    assert_redirected_to articles_and_pages_path
  end
end
