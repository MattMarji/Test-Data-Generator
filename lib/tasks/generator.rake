# Use simple tasks to run the test data generator.
# We offer two jobs - output test data to stdout or to file.
namespace :generate do
    task :test_data_default => [ :environment ] do 
        test_data = TestDataGeneratorController.new.generate
        puts JSON.generate(test_data)
    end

    task :test_data_to_file => [ :environment ] do 
        test_data = TestDataGeneratorController.new.generate
        begin
            file = File.open('./test.data', 'w')
            file.write(test_data)
        rescue IOError => e
            puts e
          ensure
            file.close unless file.nil?
        end
    end
end