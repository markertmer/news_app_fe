module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:google] = {
      :provider => "google_oauth2",
      :uid => "123456789",
      :info => {
        :name => "Happy Lama",
        :email => "happy.lama@example.com",
      },
      :credentials => {
        :token => "token",
        :refresh_token => "another_token",
        :expires_at => 1354920555,
        :expires => true
      }
    }
  end
end
