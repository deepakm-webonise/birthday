OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Settings.google.client_id,
           Settings.google.client_secret,
           { scope: 'userinfo.email, userinfo.profile, plus.me',
             prompt: 'select_account',
             image_aspect_ratio: 'square',
             image_size: 50,
             client_options: {
               ssl: { ca_file: Rails.root.join('cacert.pem').to_s }
              }
            }
end
