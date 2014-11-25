Mag-Lite
============

A simple Rails application for managing a course with lessons and user accounts.

![lessons page](https://raw.githubusercontent.com/mag-lite/mag-lite/master/doc/lessons.png)

## Setup

```
bundle install
```

Database with seed data:

```
bundle exec rake db:setup
```

To run local server:

```
bundle exec rails server
```

Then load [http://localhost:3000](http://localhost:3000) in your web browser.

## Friend Referral Program

Users should be able to provide their friend with a personal link. After the
friend follows the link and signs up, they should be recorded as referred by the
first user.

Admins should be able to view a list of user referrals so that they can see who
has referred who and send out rewards.

<hr>
<p align="center">
  :green_book:
</p>
