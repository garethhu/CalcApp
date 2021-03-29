# CalcApp

## Overview
A simple rest api that provides a prefix and an infix calculator.

## To Run
* Install [Julia](https://julialang.org/)
* 
### Linux / Mac
* From the project directory, execute
  ```shell
  ./bin/server
  ```
  
### Windows
* From the project directory, execute
  ```shell
  ./bin/server.bat
  ```
  
* To run tests run the julia repl with
  ```shell
  julia
  ```
  then enter the package prompt by pressing ']' then run:
  ```
  activate .
  test
  ```


## Hitting the API
* Using your browser go to [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
* The available endpoints are returned by the request, in json format, and organised into the prefix and infix calculators
* You can also use a tool such as curl
