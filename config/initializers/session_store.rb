# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-cas_session',
  :secret      => '586dc29d2770e428d05ddb2155f9b76d010743aa11caa55102704a5d1c57ecbcd5bf3c213db7b9f79bee2d8cad651693f61dd6ca7e1bebde46c8328559a86a1f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
