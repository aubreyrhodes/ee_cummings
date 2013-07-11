E. E. Cummings
==========

A tool to validate your environment variables

:rotating_light: *This is a work in progress and not ready for use* :rotating_light:

## Description

E. E. Cummings manages your ENV variables and gives you clear warnings when they are misconfigured.

## Installation

```
gem install ee_cummings
```
or add the following to a Gemfile
```
gem 'ee_commings'
```

## Usage

```ruby
require 'ee_cummings'

# list your environment variables
EECummings.configure do |c|

  # register an environment variable to require
  c.variable do |var|
  
    # the environment variable name
    var.name = 'API_KEY'
    
    # a regular expression that the value of the
    # variable must match
    var.regex = /[a-zA-Z0-9]+/
  end
  
  # register another varialbe
  c.variable do |var|
    var.name = 'API_SECRET'
    # regex is defaulted to /.*/
  end
end

# to retrieve the values of the environment variables
EECummings.api_secret
EECummings.api_key
```
