## Sensu-Plugins-telapi

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-telapi.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-telapi)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-telapi.svg)](http://badge.fury.io/rb/sensu-plugins-telapi)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-telapi/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-telapi)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-telapi/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-telapi)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-telapi.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-telapi)

## Functionality

## Files
 * bin/check-telapi-balance

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-telapi -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-telapi`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-telapi' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-telapi' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
