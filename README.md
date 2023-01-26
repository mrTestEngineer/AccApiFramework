## API Test Automation Framework Using Karate DSL

This Framework is created to provide functional & performance testing for the Web APIs.

### **How to Run Tests Locally**
1- Make sure GIT, Maven, and Java is installed.

2- Clone the project

    git clone https://github.com/mrTestEngineer/AccApiFramework.git

3- Navigate to webApi folder and run below command to start karate mock server locally

    java -jar karate-1.3.1.jar -m todos_mock.feature -p 5000

4- Run following command to run the smoke test suite in parallel mode
    
    mvn clean test -Dtest=ParallelTestRunner






### Reporting Integrated with Cucumber HTML Report and Karate HTML Report


![CucumberReport](/webApi/src/test/java/resources/testReportFiles/cucumber_html_report.png?raw=true "Cucumber HTML Report")

![KarateReport](/webApi/src/test/java/resources/testReportFiles/karate_html_report.png? "Karate HTML Report")

