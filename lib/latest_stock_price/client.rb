# frozen_string_literal: true
require 'uri'
require 'net/http'

module LatestStockPrice
  class Client
    def initialize
      @base_url = "https://#{ENV['RAPID_API_HOST']}"
    end

    def price(indices)
      # indices value example = ["NIFTY%2050", "NIFTY%20NEXT%2050", "NIFTY%20100", "NIFTY%20500"]
      result = get("#{@base_url}/price?Indices=#{indices}")
      puts result.read_body
    end

    def price_all
      result = get("#{@base_url}/any")
      puts result.read_body
    end

    def get(url)
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = ENV['RAPID_API_KEY']
      request["X-RapidAPI-Host"] = ENV['RAPID_API_HOST']

      http.request(request)
    end
  end
end

