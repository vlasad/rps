require 'rest_client'

module Opponents
  class Curb < Opponents::Base
    API_URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'.freeze

    def choice
      raw_response = RestClient.get API_URL
      response = JSON.parse(raw_response.body)
      validate(response)
      error_msg.blank? ? response['body'][1..-2] : ''
    end

    private

    def validate(response)
      self.error_msg = nil
      return if check_presence_error_message(response)
      return if check_absence_status_code(response)
      return if check_not_success_status_code(response)
      return if check_invalide_choice(response)
    end

    def check_presence_error_message(response)
      self.error_msg = response['errorMessage'] if response['errorMessage'].present?
    end

    def check_absence_status_code(response)
      self.error_msg = 'bad response' if response['statusCode'].blank?
    end

    def check_not_success_status_code(response)
      self.error_msg = "[statusCode: #{response['statusCode']}] #{response['body']}" if response['statusCode'] != 200
    end

    def check_invalide_choice(response)
      # strip quotes, because of server return the response like "rock" (string with quotes)
      self.error_msg = "invalid choice: #{response['body']}" if response['body'].length < 3 || !CHOICES.include?(response['body'][1..-2])
    end
  end
end
