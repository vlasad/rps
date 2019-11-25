# README

## Installation
* git clone https://github.com/vlasad/rps.git
* bundle install
* rails s

## Play
* open browser
* send request
    * http://localhost:3000/?choice=scissors
    * http://localhost:3000/?choice=rock
    * http://localhost:3000/?choice=paper

## Responses
* If you provide a bad choice or don't provide it at all, you will get bad_request status and page with text "invalid choice"
* In the case of good choice, the format page is like:
    ```
    User's choice: scissors
    Server's choice: rock
    Result: lost
    ```
