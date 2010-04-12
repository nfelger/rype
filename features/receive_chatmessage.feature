Feature: Receiving chat messages
  Background:
    Given I am using the Skype Api testing fake

  Scenario: Receiving a message
    Given a client has registered a callback for notifications about "CHATMESSAGE"
    When Skype issues a notification "CHATMESSAGE 123 STATUS RECEIVED"
    Then the callback should be called
    