Feature: stateful mock server


  Scenario: pathMatches('/todos') && methodIs('get')
    * def response = read('mock_response.json')
    * def responseStatus = 200

