# TEST DATA GENERATOR

### Description
This is a simple stripped-down Ruby on Rails project that utilizes the Faker gem to generate non-sensitive, non-PII test data.

__Note:__ The current implementation will output __50__ hashes of test data in the following requested format:

```
 [ { 
    "client_first_name": "Sandy", 
    "client_last_name": "Cohen", 
    "service_description": "routine teeth cleaning", 
    "service_date": "2019-03-04", 
    "service_performed_by": "Sam Oakland", 
    "service_amount_paid": 110.40, 
    "service_amount_currency": "USD", 
    }, ...]
```

### Pre-Requisites
<b> Running Container: </b>
The test data generator has been containerized. You will need to have docker installed where you want to run this application. <a href=https://docs.docker.com/install/>Install Docker</a>

<b> Running Locally: </b>
If you prefer to run the test data generator locally, you will have to have Ruby installed on your machine. This method is not recommended as the application is Dockerized.

### Test Data Output
The current test data can be output to __stdout__ or __to a file__ in the root directory of the repository (`/test-data-generator`). The file name is `test.data`. 

Task to output to stdout: `rake generate:test_data_default`

Task to output to file: `rake generate:test_data_to_file`

__Note:__ Each time the task `test_data_to_file ` is run to generate test data to a file, the previous file will be overwritten.

### Run (Local)
1. Download the code repository
2. Go into the repository folder: `cd ~/test-data-generator`
3. Install gems: `bundle install`
4. Run Rails server: `rails server`
5. Run Generate Task: `rake generate:test_data_to_file`

### Run (Container)
1. Download the code repository
2. Go into the repository folder: `cd ~/test-data-generator`
3. Bring the container up: `docker-compose up -d`
4. Ensure container is running: `docker ps`
5. Run Generate Task: `docker exec -it test-data-generator rake generate:test_data_to_file`

### Important Files
Noted below are the core files that are used for the test data generator.

Test Data Generator Logic: `test-data-generator/app/controllers/test_data_generator_controller.rb`

Task Logic: `test-data-generator/lib/tasks/generator.rake`