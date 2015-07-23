# regexp matches
$& = $~ = $` = $' = nil

# requires
$LOADED_FEATURES = $" = `Opal.loaded_features`
$LOAD_PATH       = $: = []

# split lines
$/ = "\n"
$, = nil

ARGV = []
ARGF = Object.new
ENV  = {}

$VERBOSE = false
$DEBUG   = false
$SAFE    = 0

RUBY_PLATFORM       = 'opal'
RUBY_ENGINE         = 'opal'
RUBY_VERSION        = '2.1.5'
RUBY_ENGINE_VERSION = '0.9.0.dev'
RUBY_RELEASE_DATE   = '2015-07-16'
RUBY_PATCHLEVEL     = 0
RUBY_REVISION       = 0
RUBY_COPYRIGHT      = 'opal - Copyright (C) 2013-2015 Adam Beynon'
RUBY_DESCRIPTION    = "opal #{RUBY_ENGINE_VERSION} (#{RUBY_RELEASE_DATE} revision #{RUBY_REVISION})"
