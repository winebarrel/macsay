# frozen_string_literal: true

require 'mkmf'
$LDFLAGS = ' -framework Cocoa ' # rubocop:disable Style/GlobalVars
create_makefile('macsay')
