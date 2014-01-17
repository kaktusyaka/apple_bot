require "apple_bot/version"
require 'mechanize'

module AppleBot
  class Client
    class << self
      def agent
        @agent ||= Mechanize.new
      end
    end
  end

  class Authorization
    class << self
      def login
        user = 'sergei.zenchenko@gmail.com'
        pass = 'K<6{72AZ?Y3Hu]Er'
        AppleBot::Client.agent.get("https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa") do |page|
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
        result = AppleBot::Client.agent.click(page.link_with(text: 'Sign Out'))
        return !result.links.include?('Sign Out')
      end
    end
  end

  class ManageUsers
    class << self
      def get_list
        page = AppleBot::Authorization.login
        page = AppleBot::Client.agent.click(page.link_with(text: 'Manage Users'))
        users = page.search('table.lcbox table a')
        return 'No users' if users.count.zero?
        users = []
        page.search('table.lcbox table a').each do |user|
          users << { name: user.text, url: user.attributes['href'].value }
        end
        users.to_json
      end
    end
  end
end
