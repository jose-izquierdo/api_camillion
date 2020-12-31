def api_auth
  page.driver.header 'API_TOKEN', Rails.application.secrets['api_token']
end

def user_auth(auth_token)
  page.driver.header 'AUTH_TOKEN', auth_token
end
