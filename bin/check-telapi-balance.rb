#! /usr/bin/env ruby
#
#   telapi-balance-check
#
# DESCRIPTION:
#   This plugin checks the account balance for TelAPI (http://www.telapi.com/).
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux, Windows, BSD, Solaris, etc
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: <?>
#
# USAGE:
#   example commands
#
# NOTES:
#   Does it behave differently on specific platforms, specific use cases, etc
#
# LICENSE:
#   Copyright 2014 Sonian, Inc. and contributors. <support@sensuapp.org>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'net/https'
require 'uri'
require 'json'

class TelAPIBalanceCheck < Sensu::Plugin::Check::CLI
  check_name 'telapi_balance_check'

  option :warn,
         short: '-w BALANCE_THRESHOLD',
         long: '--warning-threshold BALANCE_THRESHOLD',
         description: 'TelAPI Warning Balance Threshold',
         required: true

  option :critical,
         short: '-c BALANCE_THRESHOLD',
         long: '--critical-threshold BALANCE_THRESHOLD',
         description: 'TelAPI Critical Balance Threshold',
         required: true

  option :accountSID,
         short: '-a TELAPI_ACCOUNT_SID',
         long: '--account-sid TELAPI_ACCOUNT_SID',
         description: 'TelAPI Account SID',
         required: true

  option :authToken,
         short: '-t TELAPI_AUTH_TOKEN',
         long: '--auth-token TELAPI_AUTH_TOKEN',
         description: 'TelAPI Auth Token',
         required: true

  def run
    uri = URI.parse("https://api.telapi.com/v1/Accounts/#{config[:accountSID]}.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri, _initheader = { 'Content-Type' => 'application/json' })
    request.basic_auth(config[:accountSID], config[:authToken])
    response = http.request(request)
    info = JSON.parse(response.body)
    balance = info['account_balance'].to_f
    if balance < config[:critical].to_f
      critical "The TelAPI account balance is at #{balance}."
    elsif balance < config[:warn].to_f
      warning "The TelAPI account balance is at #{balance}."
    else
      ok "The TelAPI account balance is at #{balance}."
    end
  end
end
