# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demo2_session',
  :secret      => '3bef949099f210963d9a372519e86d95f9371d7def003e29050cc9de57d6734d74d7f1cce14d6e9392bcb9c8c2f5761edc72c6dcda515ef2acf61e6300a3233a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
