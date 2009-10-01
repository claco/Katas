# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HelloWorld_session',
  :secret      => '61fff9f7a3986eea4a2205666ce085e068017b1c2154fd08ce918866b47fb5fd683aad2ea55611c576ae47aedd9aca8414dd98f69db8befa77da708e81033a8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
