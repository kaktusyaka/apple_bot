require "apple_bot/version"
require 'mechanize'

module AppleBot
  # Your code goes here...
  class Authorization
    class << self
      def login
        user = 'sergei.zenchenko@gmail.com'
        pass = 'K<6{72AZ?Y3Hu]Er'
        agent.get("https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa") do |page|
          return page unless page.body.include?("Sign In")
          form = page.form_with(name: 'appleConnectForm') do |f|
            f.theAccountName = user
            f.theAccountPW   = pass
          end.submit
          return form.body.include?('Manage Your Apps') ? form : false
        end
      end

      def logout
        page = login
        result = agent.click(page.link_with(text: 'Sign Out'))
        return !result.links.include?('Sign Out')
      end

      private
      def agent
        @agent ||= Mechanize.new
      end
    end
  end
end
