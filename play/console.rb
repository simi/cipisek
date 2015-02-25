require 'irb'

module IRB # :nodoc:
  def self.start_session(binding)
    unless @__initialized
      args = ARGV
      ARGV.replace(ARGV.dup)
      IRB.setup(nil)
      ARGV.replace(args)
      @__initialized = true
    end

    workspace = WorkSpace.new(binding)

    irb = Irb.new(workspace)

    @CONF[:IRB_RC].call(irb.context) if @CONF[:IRB_RC]
    @CONF[:MAIN_CONTEXT] = irb.context

    catch(:IRB_EXIT) do
      irb.eval_input
    end
  end
end

require 'bundler/setup'
require 'cipisek'

login = ENV['USERNAME']
password = ENV['PASSWORD']

client = Cipisek::Client.new(login, password)

u = client.client_get.foreign_accounts.first
uid = u.user_id

c = client.campaigns_list(user_id = uid).campaigns[7]
cid = c.id

g = client.groups_list(uid, [cid]).groups.first
gid = g.id

k = client.keywords_list(uid, [gid]).keywords.first
kid = k.id

IRB.start_session(binding)

