require 'rumbster'

require_relative 'src/mail_listener'
require_relative 'src/logger'
require_relative 'src/security/policy'
require_relative 'src/security/mail_guard'
require_relative 'src/mail_server'
require_relative 'src/server_adapter'
require_relative 'src/event_dispatcher'
require_relative 'src/event_subscriber'

port = (ARGV[0] || 3325).to_i

file = 'data/test.log'

policies = [
  Policy::BadWordPolicy.new({
    'word_list' => File.readlines('bad_words_list.txt', chomp: true)
  }),
  Policy::RecipientPolicy.new({
    'regex' => "@(cpnv.ch|vd.ch)$"
  }),
]

event_sub = Event::MailEventSubscriber.new Logging::StdoutLogger.new

dispatcher = Event::EventDispatcher.new [event_sub]

exit 0

guard = Guard::MailGuard.new policies

listener = MailListener.new(Logging::StdoutLogger.new, guard)

server = MailServer.new(port, ServerAdapter::RumbsterAdapter, listener)

server.start