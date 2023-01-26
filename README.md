## API Test Automation Framework Using Karate DSL

This Framework is created to provide functional & performance testing for the Web APIs.

### **How to Run Tests**
1- Make sure GIT, Maven, and Java is installed.

2- Clone the project

    git clone https://github.com/mrTestEngineer/AccApiFramework.git

3- Run following command to run the smoke test suite in parallel mode in QA
    
    mvn clean test -Dkarate.options="--@tags @smoke" -Dkarate.env="qa"





### Reporting Integrated with Cucumber HTML Report and Karate HTML Report


![CucumberReport](/webApi/src/test/java/resources/testReportFiles/cucumber_html_report.png?raw=true "Cucumber HTML Report")

![KarateReport](/webApi/src/test/java/resources/testReportFiles/karate_html_report.png? "Karate HTML Report")

