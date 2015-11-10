class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first_or_initialize.tap do |user|
      debugger
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.birthday = Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y") if auth.extra.raw_info.birthday
      user.remote_avatar_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
