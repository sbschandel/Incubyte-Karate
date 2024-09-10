Feature: Gmail Compose Error Handling

@Negativecase1
  Scenario: Send an email without a recipient
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body without recipient>'}
    When method post
    Then status 400
    And match response.error.message contains 'Recipient address required'

  @Negativecase2
  Scenario: Send an email with an invalid recipient
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body with invalid recipient>'}
    When method post
    Then status 400
    And match response.error.message contains 'Invalid recipient email'

  @Negativecase3
  Scenario: Send an email without a subject
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer <your-access-token>' }
    And request {"raw": '<encoded email body without subject>'}
    When method post
    Then status 400
    And match response.error.message contains 'Subject is required'


  @Negativecase4
  Scenario: Send an email with an invalid access token
    Given url 'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'
    And headers { Authorization: 'Bearer invalid-token' }
    And request {"raw": '<encoded email body>'}
    When method post
    Then status 401
    And match response.error.message contains 'Invalid Credentials'