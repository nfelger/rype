Feature: Send a chat message

  Background:
    Given I am using the Skype Api testing fake

  Scenario: Send message
    Given there is a chat with id "#test/$echo123;2010fc482c5ce233"
    When I send a chatmessage "Howdy pal!" to "#test/$echo123;2010fc482c5ce233"
    Then the Skype Api should receive the message 
      """
      CHATMESSAGE #test/$echo123;2010fc482c5ce233 Howdy pal!
      """
    