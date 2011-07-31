# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_follow_session',
  :secret      => 'e4297ea47649763b4d19299770ad8435baaea47379a20a833f6b05554011937af10742ec3aa1e8a1c99f61f3a6471ba4698f60205f7704c492f27dd1966f60a3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
