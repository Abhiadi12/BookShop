# README

A webapp where user can buy or sell books .

Things you may want to cover:

* Ruby version
  2.6.3
* Rails version
  6.0
* database
  sqlite
* Configuration
  for twilio and omniauth configuration you have to use your own APP ID
  for sending emails , must configure the SMTP protocol
  for cron job and sidekiq make sure you have appropiate setting
  for action cable make sure you integrate websocket

Features:
1.Authenitcation and authorization
2.Add book to your profile for sell
3.Search book details and add to cart
4.Advance search feature based on author name and price
5.Realtime rating and notifications
6.Background processing to notify the owner of the book after payment
7.Top books based on rating and send new book details regulary(in a week) to the user who subscribe the notify option

NOTE:
For payment process i consider, if the phone number of a user veify then after some X minutes he/she gets the notification about their process
