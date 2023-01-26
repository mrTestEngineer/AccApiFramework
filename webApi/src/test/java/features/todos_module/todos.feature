Feature: Covers all HTTP GET calls

  Background: settings here
    # we can think of background as before hooks that will be evaluated before each test, so we can keep common resources here 
    # suchh as urls, data files, payloads, etc.
    * url base_url
    * def get_todos_responseModel = read('classpath:resources/responseModels/todos/todos_response_model.json')


  @get_all @smoke  
  Scenario: get entire object
    Given path 'todos'
    When method GET
    Then status 200
    * match each response == get_todos_responseModel
    * print "GET Response::", response