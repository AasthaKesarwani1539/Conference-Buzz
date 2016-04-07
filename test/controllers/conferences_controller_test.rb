require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  setup do
    @conference = conferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conference" do
    assert_difference('Conference.count') do
      post :create, conference: { cfp_closes_on: @conference.cfp_closes_on, cfp_opens_on: @conference.cfp_opens_on, created_by: @conference.created_by, created_by_email: @conference.created_by_email, from_date: @conference.from_date, title: @conference.title, to_date: @conference.to_date, topic_id: @conference.topic_id, url: @conference.url, venue_city: @conference.venue_city, venue_country: @conference.venue_country }
    end

    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should show conference" do
    get :show, id: @conference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conference
    assert_response :success
  end

  test "should update conference" do
    patch :update, id: @conference, conference: { cfp_closes_on: @conference.cfp_closes_on, cfp_opens_on: @conference.cfp_opens_on, created_by: @conference.created_by, created_by_email: @conference.created_by_email, from_date: @conference.from_date, title: @conference.title, to_date: @conference.to_date, topic_id: @conference.topic_id, url: @conference.url, venue_city: @conference.venue_city, venue_country: @conference.venue_country }
    assert_redirected_to conference_path(assigns(:conference))
  end

  test "should destroy conference" do
    assert_difference('Conference.count', -1) do
      delete :destroy, id: @conference
    end

    assert_redirected_to conferences_path
  end
end
