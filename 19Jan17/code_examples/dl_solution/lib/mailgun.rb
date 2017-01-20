require "mailgun/version"
require "rest-client"

class Mailgun
  attr_reader :api_key

  def initialize
    @api_key = YAML.load(File.new("config/api_key.yml").read)
  end

  def send_message
    RestClient.post messages, message
  end

  def is_suppressed? email
    suppression_list = RestClient.get @api_key + "bounces"
    suppressions = JSON.parse suppression_list.body
    suppressions["items"].map { |i| i.has_value? email}.any?
  end

  def messages
    @api_key + "messages"
  end

  def message
    {
      from:    "Mailgun Sandbox <postmaster@sandboxe87c271180a841b083bdb3590952dab3.mailgun.org>",
      subject: "Testing"                                                                         ,
      to:      "444c43@gmail.com"                                                                ,
      name:    "DL Cummings"                                                                     ,
      text:    "Successful body message!"
    }
  end
end
