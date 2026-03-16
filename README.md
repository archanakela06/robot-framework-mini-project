# robot-framework-mini-project
Robot framework mini project
**Robot Framework Enterprise-Style Automation Framework**
A scalable UI automation framework built using Robot Framework, Selenium, and Python.
This project demonstrates how an enterprise automation framework can be structured with environment configuration, external test data management, reusable keywords, and organized execution reports.

The goal of this project is to implement industry-level automation framework practices such as modular design, maintainability, and scalable test architecture.

**Key Features**
1. Environment-based configuration using YAML files
2. Externalized test data management
3. Modular keyword-driven design
4. Page-specific reusable keyword libraries
5. Automated browser configuration and initialization
6. Automatic screenshot capture on test failure
7. Organized test execution reports
8. Date-wise execution report storage
9. Easy environment switching via CLI

**Technology Stack**
1. Automation Framework: Robot Framework
2. Browser Automation: Selenium
3. Programming Language: Python
4. Configuration Format: YAML
5. Version Control: Git / GitHub

**Framework Architecture**
The framework follows a layered design separating configuration, test data, reusable keywords, and test cases.
Robot_Framework_Mini_Project
│
├── core
│   ├── config_manager.py
│   └── data_manager.py
│
├── configs
│   └── env
│       └── qa.yaml
│
├── resources
│   └── keywords
│       ├── framework_keywords.resource
│       ├── common_keywords.resource
│       └── LoginKeywords
│           └── login_keywords.resource
│
├── testData
│   └── login
│       └── login.yaml
│
├── tests
│   └── LoginTest
│       └── login_test.robot
│
├── results
│
├── requirements.txt
└── README.md
**Framework Components**
**Config Manager**
The Config Manager loads environment-specific configuration from YAML files.
This allows the same tests to run against multiple environments such as QA, staging, or production.

Example configuration: configs/env/qa.yaml
The framework loads the configuration dynamically using the ENV variable.

**Data Manager**
The Data Manager reads test data from YAML files and returns data based on the test scenario.
Example: testData/login/login.yaml
This allows tests to be data-driven and maintainable.

**Reusable Keyword Layer**
Reusable keywords are stored in the resources/keywords directory.

There are three layers:
**Framework Keywords**
1. Environment loading
2. Data loading
**Common Keywords**
1. Browser initialization
2. Screenshot handling
3. Global reusable utilities
**Feature/Page Keywords**
1. Login functionality
2. Page-specific actions
This separation ensures clean and maintainable test design.
**Test Execution**
Tests can be executed from the command line using the Robot Framework CLI.
Example command:
robot --pythonpath . -v ENV:qa -d results tests
Where:
Parameter                	Description
--pythonpath .	          Allows framework modules to be imported
-v ENV:qa	                Selects the environment configuration
-d results	              Stores execution reports inside the results folder
tests	                    Executes all test suites
**Execution Reports**
After test execution, the following reports are generated:
- log.html
- report.html
- output.xml
All reports and screenshots are stored inside the results directory.
Example:
results/
   2026-03-16_10-30-15/
       log.html
       report.html
       output.xml
       screenshots/
**Screenshot Handling**
Screenshots are automatically captured when a test fails.
These screenshots are embedded directly inside the Robot Framework HTML logs for easier debugging.

**Installation**
Clone the repository: git clone https://github.com/yourusername/robot-framework-mini-project.git
Navigate to the project folder: cd robot-framework-mini-project
Install dependencies: pip install -r requirements.txt
**Future Improvements**
Planned enhancements include:
- CI/CD integration
- Parallel test execution
- API testing integration
- Test tagging and selective execution
- Reporting enhancements
- Integration with test management tools
