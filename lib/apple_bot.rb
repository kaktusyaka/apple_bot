require "apple_bot/version"
require 'mechanize'

module AppleBot
  # Your code goes here...
  class Login
    class << self
      def login
        @agent = Mechanize.new
        user = 'sergei.zenchenko@gmail.com'
        pass = 'K<6{72AZ?Y3Hu]Er'
        @agent.get("https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa") do |page|
          form = page.form_with(name: 'appleConnectForm') do |f|
            f.theAccountName = user
            f.theAccountPW   = pass
          end.submit
          if form.body.include?('Manage Your Apps')
            return form
          else
            return false
          end
        end
      end

      def logout
        page = login
        result = @agent.click(page.link_with(text: 'Sign Out'))
        return !result.links.include?('Sign Out')
      end
    end
  end
end
