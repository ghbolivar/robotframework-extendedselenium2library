#    Extended Selenium2 Library - a web testing library with AngularJS support.
#    Copyright (c) 2015, 2016 Richard Huang <rickypc@users.noreply.github.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*** Settings ***
Library         ${CURDIR}/../../../src/ExtendedSelenium2Library
Suite Setup     Suite Setup
Suite Teardown  Close Browser
Test Setup      Test Setup

*** Test Cases ***
Test ES2L Without Confirm Action
    [Documentation]  Click link without confirm action in ES2L
    ${error} =  Run Keyword And Expect Error  *
    ...  Page Should Contain  teapot
    Should Contain  ${error}  UnexpectedAlertPresentException
    Should Contain  ${error}  WebDriverException

Test ES2L With Confirm Action
    [Documentation]  Click link with confirm action in ES2L
    Confirm Action
    Page Should Contain  teapot

*** Keywords ***
Suite Setup
    [Documentation]  Suite setup for all ES2L test cases
    Open Browser  file://${CURDIR}/../html/issue_3.html  ff
    Set Selenium Implicit Wait  0
    Choose Ok On Next Confirmation

Test Setup
    [Documentation]  Test setup for ES2L test cases
    Go Back
    Click Link  Delete  skip_ready=${true}
