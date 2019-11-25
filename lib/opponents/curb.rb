require 'rest_client'

module Opponents
  class Curb < Opponents::Base
    API_URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'.freeze

    def choice
      raw_response = RestClient.get API_URL
      response = JSON.parse(raw_response.body)
      validate(response)
      errorMsg.blank? ? response['body'][1..-2] : ''
    end

    private

    def validate(response)
      self.errorMsg = nil
      (self.errorMsg = response['errorMessage']) && return if response['errorMessage'].present?
      (self.errorMsg = 'bad response') && return if response['statusCode'].blank?
      (self.errorMsg = "[statusCode: #{response['statusCode']}] #{response['body']}") && return if response['statusCode'] != 200
      # strip quotes, because of server return the response like "rock" (string with quotes)
      (self.errorMsg = "invalid choice: #{response['body']}") && return if response['body'].length < 3 || !CHOICES.include?(response['body'][1..-2])
    end
  end
end
