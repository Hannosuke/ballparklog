# frozen_string_literal: true

require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require "capistrano/rails"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/puma"

require "capistrano/safe_deploy_to"

install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Daemon
install_plugin Capistrano::SCM::Git
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
