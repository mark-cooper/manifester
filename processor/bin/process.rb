#!/usr/bin/env ruby

# processes manifest for $site

require          'optparse'
require_relative '../config/db'

options  = {}
required = ['site']

optparse = OptionParser.new do |opts|
  opts.on('-s', '--site SITE', 'Site code') do |site|
    options[:site] = site
  end
end

optparse.parse!

missing = required.select { |param| options[param.to_sym].nil? }
unless missing.empty?
  raise OptionParser::MissingArgument, "Required: #{required.join(',')}"
end

puts "Site: #{options[:site]}"
