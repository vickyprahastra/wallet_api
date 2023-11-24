module Api
  module V1
    class ApplicationController < ActionController::Base
      layout 'blank'
      # after_action :allow_iframe
      before_action :set_cors_headers

      private

      # def allow_iframe
      #   response.headers.except! 'X-Frame-Options'
      # end

      def set_cors_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Credentials'] = 'true'
      end
    end
  end
end
