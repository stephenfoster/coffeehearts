# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_heart_session',
  :secret      => '1ef24fcff5e7c42893e2f24c3b8f339b226255fe207902be3b3da199d13569f328aeb5aa771420b5e709e0212e615f3715cce5e21adfed8ec534857a0fa45398'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
