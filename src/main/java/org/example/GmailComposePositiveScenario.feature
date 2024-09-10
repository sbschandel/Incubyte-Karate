Feature: Gmail Compose Functionality

  @Positivecase1
  Scenario: Send an email with correct subject and body
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body>'}
    When method post
    Then status 200
    And match response == { id: '#string', labelIds: '#array' }

@Positivecase2
 Scenario: Send an email to multiple recipients
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body with multiple recipients>'}
    When method post
    Then status 200
    And match response == { id: '#string', labelIds: '#array' }

@Positivecase3

 Scenario: Save an email as a draft
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/drafts'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"message": {"raw": '<encoded email body>'}}
    When method post
    Then status 200
    And match response == { id: '#string', message: { id: '#string', labelIds: '#array' } }

  @Positivecase4
  Scenario: Verify email is present in the Sent folder
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And params { labelIds: 'SENT', q: 'subject:Incubyte' }
    When method get
    Then status 200
    And match response.messages contains { id: '#string' }

  @Positivecase5
  Scenario: Send an email with an empty body
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body with empty content>'}
    When method post
    Then status 400
    And match response.error.message contains 'Body content is required'

  @Positivecase6
  Scenario: Send an email with an attachment
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body with attachment>'}
    When method post
    Then status 200
    And match response == { id: '#string', labelIds: '#array' }