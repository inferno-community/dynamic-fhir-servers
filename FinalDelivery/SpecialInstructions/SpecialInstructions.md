# README

The fhir-api provides a dynamic server for handling get/search requests based on user provided json data in the form of the implementation guide that contains a capability statement

## REST API:

### GetById

Ability to search for specific resources by id and get data back based on example json data provided for that resource

#### Route:

GET /resource/id

#### Response:

resource JSON

### Search

Ability to query with various valid parameter combinations and get data back based on example json data provided for that resource

#### Route:

GET /resource?queryParameters

#### Response:

resource JSON

#### Requires:

fhir-validator-wrapper running in the background found at: https://github.com/inferno-community/fhir-validator-wrapper

#### Route:

POST /resource BODY: Must contain "id", "resource_type", "resource"

#### Reponse:

created resource JSON

#### Route:

DELETE /resource/id

#### Reponse:

successfully deleted resource with specified id

#### Route:

PUT /resource/id BODY: Must contain valid JSON to be stored in resource column

#### Reponse:

successfully updated resource with specified id

## System dependencies

Requires PostGreSQL installed 1.2.3 or above

Requires Ruby version 2.7.2

Requires Rails 6.0.3.4

## Configuration

Assumes default PostGreSQL password, can be modified in the Database.yml file as needed

## Database creation - this ideally will be simplified in the future to be one command that can run on startup without user interaction

```shell script
rake db:create
rake db:structure:load
# To load json example data from <Ruby Root>/db/seeds/package/example/
rake db:seed json_file='package'
# To load json data from Synthea from <Ruby Root>/db/seeds/synthea
rake db:seed json_file='synthea'
```

## Running Locally

### Initial Setup Commands

```shell script
bundle install
```

### Starting up server each time

```shell script
rails s
```

#### Note: https://github.com/inferno-community/fhir-validator-wrapper must be running on port 4567 if using search commands
