This project is available online and can be tested through the following
curl commands

List rooms:
curl https://radiant-earth-70611.herokuapp.com/rooms

Create room:
curl https://radiant-earth-70611.herokuapp.com/rooms --data "room[name]='Room name'"

Edit room:
curl --request PATCH https://radiant-earth-70611.herokuapp.com/rooms/1 --data "room[name]='Labo002'"

Delete room:
curl --request DELETE https://radiant-earth-70611.herokuapp.com/rooms/1

List meetings:
curl https://radiant-earth-70611.herokuapp.com/meetings

Filter meetings:
curl --request GET https://radiant-earth-70611.herokuapp.com/meetings --data "room_id=2" --data "start_time=2018-11-30 11:30" --data "end_time=2018-11-30 13:00"

Create meeting:
curl https://radiant-earth-70611.herokuapp.com/meetings --data "meeting[title]='Meeting title'" --data "meeting[room_id]=2" --data "meeting[start_time]='2018-11-30 11:30'" --data "meeting[end_time]='2018-11-30 13:00'"

Edit meeting
curl --request PATCH https://radiant-earth-70611.herokuapp.com/meetings --data "meeting[title]='Meeting title'" --data "meeting[room_id]=2" --data "meeting[start_time]='2018-11-30 11:30'" --data "meeting[end_time]='2018-11-30 13:00'"

Delete meeting:
curl --request DELETE https://radiant-earth-70611.herokuapp.com/meetings/1

If you want to run this project in your machine (instructions based on linux):

- Install ruby and rails (https://gorails.com/setup/ubuntu/18.04)
- Create a postgresql user (sudo -u postgres createuser postgres -s)
- Setup database (rails db:setup)
- Start server (rails s)
- Test using the curl commands above (changing
  https://radiant-earth-70611.herokuapp.com to http://localhost:3000)

Running tests:

- Install ruby and rails (https://gorails.com/setup/ubuntu/18.04)
- Create a postgresql user (sudo -u postgres createuser postgres -s)
- Setup database (rails db:setup)
- Run tests (rails test)
- Check code coverage
(open the on browser the file /scheduling_api/coverage/index.html)
