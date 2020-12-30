RSpec.configure do |config|
 config.before(:suite) do
    # Clean all tables to start
    DatabaseCleaner.clean_with :truncation
    # Use transactions for tests
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end