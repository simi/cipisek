require 'xmlrpc/client'
require 'cipisek/response'
require 'cipisek/response/client_get'
require 'cipisek/response/campaigns_list'
require 'cipisek/response/groups_list'
require 'cipisek/response/groups_stats'
require 'cipisek/response/keywords_list'
require 'cipisek/response/keywords_stats'

# :(
XMLRPC::Config.module_eval {remove_const(:ENABLE_NIL_PARSER)}
XMLRPC::Config.const_set(:ENABLE_NIL_PARSER, true)

module Cipisek
  class Error < Exception; end;
  class Client
    attr_accessor :client, :logged, :session, :login, :password

    def initialize(login, password, params = {})
      self.client = XMLRPC::Client.new3(default_connect_params.merge(params))
      self.login = login
      self.password = password
    end

    def connect
      return if logged?
      response = client.call("client.login", self.login, self.password)
      self.session = response["session"]
    end

    def call(method, klass = Cipisek::Response, *args)
      connect unless logged?

      args[0] ||= {}
      args[0].merge!(session: self.session)

      response_hash = self.client.call(method, *args)

      response = klass.new(response_hash)
      self.session = response.session if response.session

      if response.status == 200
        response
      else
        raise Cipisek::Error.new("#{response.status} #{response.status_message}\n #{response.diagnostics}")
      end
    end

    def client_get
      self.call('client.get', Cipisek::Response::ClientGet)
    end

    def campaigns_list(user_id = nil)
      self.call('campaigns.list', Cipisek::Response::CampaignsList, userId: user_id)
    end

    def groups_list(user_id = nil, campaign_ids = [])
      self.call('groups.list', Cipisek::Response::GroupsList, {userId: user_id}, {campaignIds: campaign_ids})
    end

    def groups_stats(user_id = nil, group_ids = [], date_from = nil, date_to = nil, granularity = nil)
      date_from = XMLRPC::DateTime.new(date_from.year, date_from.month, date_from.day, 0, 0, 0)
      date_to = XMLRPC::DateTime.new(date_to.year, date_to.month, date_to.day, 0, 0, 0)
      self.call('groups.stats', Cipisek::Response::GroupsStats, {userId: user_id}, group_ids, {dateFrom: date_from, dateTo: date_to, granularity: granularity})
    end

    def keywords_list(user_id = nil, group_ids = [], only_id = false)
      self.call('keywords.list', Cipisek::Response::KeywordsList, {userId: user_id}, {groupIds: group_ids}, {onlyId: only_id})
    end

    def keywords_stats(user_id = nil, keyword_ids = [], date_from = nil, date_to = nil, granularity = 'daily')
      date_from = XMLRPC::DateTime.new(date_from.year, date_from.month, date_from.day, 0, 0, 0)
      date_to = XMLRPC::DateTime.new(date_to.year, date_to.month, date_to.day, 0, 0, 0)
      self.call('keywords.stats', Cipisek::Response::KeywordsStats, {userId: user_id}, keyword_ids, {dateFrom: date_from, dateTo: date_to, granularity: granularity})
    end

    def logged?
      !!self.session
    end

    def default_connect_params
      {
        host: 'api.sklik.cz',
        path: '/cipisek/RPC2',
        port: 443,
        use_ssl: true
      }
    end
  end
end
