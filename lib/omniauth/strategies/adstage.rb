require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Adstage < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :adstage
      option :provider_ignores_state, :true

      option :client_options, {
        :site => (ENV['ADSTAGE_ENDPOINT'] || "https://www.adstage.io"),
        :authorize_url => "/oauth/authorize"
      }

      uid { user_info['id'] }

      info do
        info_hash = properties(user_info)
        info_hash[:organizations] = organizations_info
        info_hash
      end

      private

      def user_info
        @user_info ||= access_token.get('/api/me').parsed
      end

      def organizations_info
        user_info['_embedded']['adstage:organizations'].map { |org| properties(org) }
      end

      def properties(entity)
        entity.except('_embedded', '_forms', '_links')
      end
    end
  end
end
