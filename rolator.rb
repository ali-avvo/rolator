require 'slack-ruby-bot'
require 'slack-ruby-client'

class Rolator < SlackRubyBot::Bot
  command 'honk' do |client, data, match|
    #client.say(text: 'hello', channel: data.channel)
    slacker = Slack::Web::Client.new
    slacker.chat_postMessage(channel: data.channel, text: "Time is #{Time.now}", as_user: true)
  end

  command 'roles' do |client, data, match|
    slacker = Slack::Web::Client.new
    message = "Look who is here: "
    #require 'pry';binding.pry
    members = slacker.conversations_members(channel: data.channel).members
    members.each do |member|
      message += slacker.users_info(user: member).user.real_name
      message += ", "
    end
    slacker.chat_postMessage(channel: data.channel, text: message, as_user: true)
  end

end

Rolator.run
