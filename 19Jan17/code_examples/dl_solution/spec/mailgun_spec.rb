require 'spec_helper'
require 'webmock/rspec'
require "rest-client"

describe Mailgun do
  subject { described_class.new }

  before(:each) do
    stub_request(:post, "https://api.mailgun.net/v3/sandboxe87c271180a841b083bdb3590952dab3.mailgun.org/messages")
      .with(:body => {
        "from"=>"Mailgun Sandbox <postmaster@sandboxe87c271180a841b083bdb3590952dab3.mailgun.org>",
        "name"=>"DL Cummings",
        "subject"=>"Testing",
        "text"=>"Successful body message!",
        "to"=>"444c43@gmail.com"},
        :headers => {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip, deflate',
          'Authorization'=>'Basic YXBpOmtleS0xYTdjMDc1YWViN2Q3MGVjMmE1Y2VjYWQ1MjhiMzM3Zg==',
          'Content-Length'=>'178',
          'Content-Type'=>'application/x-www-form-urlencoded',
          'Host'=>'api.mailgun.net',
          'User-Agent'=>'rest-client/2.0.0 (darwin14.4.0 x86_64) ruby/2.1.6p336'})
      .to_return(:status => 200, :body => "", :headers => {})
  end

  it 'has a version number' do
    expect(subject.version).not_to be nil
  end

  it 'returns a 200 status when sending post request' do
    expect(subject.send_message.code).to eq 200
  end
end
