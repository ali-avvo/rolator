require 'slack-ruby-bot'
require 'slack-ruby-client'

class Rolator < SlackRubyBot::Bot
  command 'honk' do |client, data, match|
    #client.say(text: 'hello', channel: data.channel)
    slacker = Slack::Web::Client.new
    slacker.chat_postMessage(channel: '#rolator_test', text: "Time is #{Time.now}", as_user: true)
  end
end

Rolator.run
