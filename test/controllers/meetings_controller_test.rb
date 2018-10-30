require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get meetings_url, as: :json
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post meetings_url, params: { meeting: { end_time: @meeting.end_time + 1.day, room_id: @meeting.room_id, start_time: @meeting.start_time + 1.day, title: @meeting.title } }, as: :json
    end

    assert_response 201
  end

  test "should not create invalid meeting" do
    old_meeting = Meeting.first
    new_meeting = Meeting.new(title: 'New meeting',
      room_id: old_meeting.room_id, end_time: old_meeting.end_time,
      start_time: old_meeting.start_time)
    refute new_meeting.valid?
    assert_not_nil new_meeting.errors[:room_id], 'Room unavailable for this time slot'

    assert_no_difference('Meeting.count') do
      post meetings_url, params: { meeting: { end_time: new_meeting.end_time,
        room_id: new_meeting.room_id, start_time: new_meeting.start_time,
        title: new_meeting.title } }, as: :json
    end

    assert_response 422
  end

  test "should show meeting" do
    get meeting_url(@meeting), as: :json
    assert_response :success
  end

  test "should update meeting" do
    patch meeting_url(@meeting), params: { meeting: { end_time: @meeting.end_time + 1.day, room_id: @meeting.room_id, start_time: @meeting.start_time + 1.day, title: @meeting.title } }, as: :json
    assert_response 200
  end

  test "should not update meeting" do
    first_meeting = Meeting.first
    patch meeting_url(@meeting), params: { meeting: { end_time: first_meeting.end_time, room_id: first_meeting.room_id, start_time: first_meeting.start_time, title: @meeting.title } }, as: :json
    assert_response 422
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete meeting_url(@meeting), as: :json
    end

    assert_response 204
  end
end
