# coding: utf-8
# vi: set fenc=utf-8 ft=ruby ts=8 sw=2 sts=2 et:
module Puppet::Parser::Functions

  newfunction(:ensure_state, :type => :rvalue, :doc => <<-'begin') do |args|
    Returns true if the given parameter does not match any keyword commonly
    associated with absence, false otherwise.
  begin

    if args.size != 1
      message = "Usage: ensure_state('...')"
      raise Puppet::ParseError, message
    end

    if args[0].to_s.match(/^(absent|false|purged|stopped)$/)
      result = false
    else
      result = true
    end

    return result

  end

end
