# frozen_string_literal: true

require 'bundler/setup'
require 'gosu'

Dir[File.expand_path('../**/*.rb', __dir__)].sort.each { |file| require file }