# spatial_ref_sys table is not cleaned up because it contains SRID data for the postgis extension
RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.clean_with(:truncation, { except: %w[spatial_ref_sys] })
  end
  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation, { except: %w[spatial_ref_sys] })
  end
  config.after(:all) do
    DatabaseCleaner.clean_with(:truncation, { except: %w[spatial_ref_sys] })
  end
end
