require 'slack-ruby-bot'

class Rolator < SlackRubyBot::Bot
  command 'hi' do |client, data, match|
    client.say(text: 'hello', channel: data.channel)
  end
end

Rolator.run
