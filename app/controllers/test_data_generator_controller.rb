require 'faker'
require 'json'

class TestDataGeneratorController < ApplicationController    

=begin
    This function will generate non-sensitive test data that is psuedo-random.
    Fake data expected output:

    [ { 
    "client_first_name": "Sandy", 
    "client_last_name": "Cohen", 
    "service_description": "routine teeth cleaning", 
    "service_date": "2019-03-04", 
    "service_performed_by": "Sam Oakland", 
    "service_amount_paid": 110.40, 
    "service_amount_currency": "USD", 
    }, ...]
=end
    def generate(num_iterations=50)
        current_iteration = 0
        generated_data = []

        while(current_iteration < num_iterations)
            test_case_hash = 
                    {
                        :client_first_name => Faker::Name.first_name,
                        :client_last_name => Faker::Name.last_name,
                        :service_description => Faker::Lorem.sentence(1, false, 10).gsub('.',''),
                        :service_date => Faker::Date.between(10.years.ago, Date.today).strftime('%F'),
                        :service_performed_by => Faker::Name.name,
                        :service_amount_paid => Faker::Number.decimal(Faker::Number.between(1, 5), 2),
                        :service_amount_currency => Faker::Currency.code
                    }
            generated_data.push(JSON.generate(test_case_hash))
            current_iteration +=1
        end
        return generated_data
    end
end