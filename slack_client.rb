require 'slack-ruby-client'
require 'pry'


Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

client.auth_test

binding.pry

client.chat_postMessage(channel: '#rolator_test', text: "Time is #{Time.now}", as_user: true)
