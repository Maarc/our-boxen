# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.1"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.4"
# Dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisement and network boot.
#github "dnsmasq",     "2.0.1"
# Foreman is an open source project that gives system administrators the power to easily automate repetitive tasks, quickly deploy applications, and proactively manage servers, on-premises or in the cloud.
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.1.0"
# Homebrew installs the stuff you need that Apple didn’t.
github "homebrew",    "1.11.2"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
#github "nginx",       "1.4.4"
#github "nodejs",      "4.0.0"
#github "openssl",     "1.0.0"
#github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at https://github.com/boxen.
# References - http://rosslawley.co.uk/posts/automate-all-the-things/
# Nice tutorial - http://www.sitepoint.com/boxen-quit-worrying-tools/


# GO
#github "zsh",             "1.0.0"
#github "skype",           "1.0.8"
#github "osx",             "2.7.0"
#github "slate",           "1.0.25"
#github "wget",            "1.0.1"
#github "sublime_text",    "1.0.1"
#github "virtualbox",      "1.0.9"
#github "dropbox",         "1.3.0"
#github "iterm2",          "1.2.4"
#github "java",            "1.8.0"


# MAYBE
#github "intellij",        "1.5.1"
#github "vagrant",         "3.1.1"
#github "adium",           "1.4.0"
#github "chrome",          "1.1.2"

# NO GO
#github "flowdock",        "1.0.0"

