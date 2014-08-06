class Fbuser < ActiveRecord::Base

  def self.from_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |fbuser|

      fbuser.provider = auth.provider

      fbuser.uid = auth.uid

      fbuser.name = auth.info.name

      fbuser.oauth_token = auth.credentials.token

      fbuser.oauth_expires_at = Time.at(auth.credentials.expires_at)

      fbuser.save!

    end

  end

end
