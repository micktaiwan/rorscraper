# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scraper_session',
  :secret      => 'b1894f5edae35bbbf8e3099506d507e72e89ac79ad29c8c572f54b09f01cf7020da2375bc247c85b78ce4ec661df98f49cbc505ffcf6298a3fd8ffcf594362ff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
