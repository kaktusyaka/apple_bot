require "apple_bot/version"
require 'mechanize'

module AppleBot
  # Your code goes here...
  class SignIn
    class << self
      def login
        agent = WWW::Mechanize.new
        agent.get("https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa")
        puts 'logged'
      end

      def logout
        puts 'logout'
      end
    end
  end
end
