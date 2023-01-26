@parallel=true
Feature: Covers all HTTP GET calls

  Background: settings here
    # we can think of background as before hooks that will be evaluated before each test, so we can keep common resources here 
    # such as urls, data files, payloads, etc.
    * url mock_url
    * print "Base URL::", mock_url
    * def get_todos_responseModel = read('classpath:resources/responseModels/todos/todos_response_model.json')
    # util in line js method to get an index of an item from an array
    * def get_index = function(target, item){ return target.indexOf(item)}


  @get_all @smoke  
  Scenario: get entire object and verify status code and response schema
    Given path 'todos'
    When method get
    Then status 200
    * match each response == get_todos_responseModel
    * print "GET Response::", response


  @smoke
  Scenario: Verify the size of todo objects in todos array
    Given path 'todos'
    When method GET
    Then status 200
    # here, we need to know the expected size
    * match karate.sizeOf(response[0].todos) == 10


  @smoke
  Scenario: Verify todo items present or not
    # sometimes we might need to make sure certain elements are present in response
    Given path 'todos'
    When method GET
    Then status 200
    # check a certain to_do is part of the api response
    # we can read this expected values from any source we want such as database, json file, csv file, yaml etc.
    # first, lets print all todos to see how they look
    * def all_todos = $response[0].todos[*]todo
    * print 'All Todos::', all_todos
    * def required_todo = "Finish the Accumulus coding challenge"
    * match all_todos contains required_todo


  @smoke
  Scenario: Verify the status of a given todo from response
    Given path 'todos'
    When method GET
    Then status 200
    * def target_todo = "Finish the Accumulus coding challenge"
    # lets verify whether our required task is completed
    * def all_todos = $response[0].todos[*]todo
    * def index_of_todo = get_index(all_todos, target_todo)
    * print 'Target Todos::', response[0].todos[index_of_todo]
    * def is_task_completed = response[0].todos[index_of_todo].completed
    * match is_task_completed == true


  @smoke
  Scenario: Verify todos based on UserId
    Given path 'todos'
    When method GET
    Then status 200
    * def target_todo = "Finish the Accumulus coding challenge"
    # ideally, we should keep test data in a separate file, not hard coded here.
    * def target_userId = 87
    * def all_todos = $response[0].todos[*]
    * def filter_by_userId = function(x){return x.userId == target_userId}
    * def get_todos_by_UserId = karate.filter(all_todos, filter_by_userId)
    * print 'All Todos for Target UserId::', get_todos_by_UserId
    * def userIds = $get_todos_by_UserId[*].userId
    * match each userIds == target_userId
    # lets also verify the completed task number is greater than not completed tasks for the target user
    * def is_completed = 0
    * def is_NOT_completed = 0
    * def check_todo_status =
    """
      function(x){
        if(x.completed == true){
          is_completed += 1;
        }else{
          is_NOT_completed += 1;
        }
      }
    """
    * karate.forEach(get_todos_by_UserId, check_todo_status)
    * print 'Number of Completed Todos::', is_completed
    * print 'Number of NOT-Completed Todos::', is_NOT_completed
    * assert is_completed > is_NOT_completed
