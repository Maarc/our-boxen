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
#github "nginx",      "1.4.4"
#github "nodejs",     "4.0.0"
#github "openssl",    "1.0.0"
#github "phantomjs",  "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at https://github.com/boxen.
# References - http://rosslawley.co.uk/posts/automate-all-the-things/
# Nice tutorial - http://www.sitepoint.com/boxen-quit-worrying-tools/


# General settings for OSX ...
github "osx",             "2.8.0"
github "java",            "1.8.0"
github "wget",            "1.0.1"
github "dropbox",         "1.4.1", :repo => "takashiyoshida/puppet-dropbox"
github "virtualbox",      "1.0.14", :repo => "maarc/puppet-virtualbox"
github "evernote",        "2.0.7"
github "firefox",         "1.2.4", :repo => "maarc/puppet-firefox"
github "things",          "2.0.0", :repo => "nickpellant/puppet-things"
github "onepassword",     "1.1.5"
github "iterm2",          "1.2.4"
github "sublime_text",    "1.1.0"
github "libreoffice",     "4.2.7", :repo => "maarc/puppet-libreoffice"
github "alfred",          "1.4.0"
github "skype",           "1.1.0"
github "onyx",            "1.2.0" 
github "spotify",         "1.0.2"
github "vlc",             "1.1.0"
github "adium",           "1.4.0"
github "vagrant",         "3.2.2"
github "sourcetree",      "1.0.0"
github "jmeter",          "0.1.5"
github "intellij",        "1.5.1"
github "nmap",            "1.0.3"
github "fonts",           "0.0.3"
github "dia",             "0.0.2"
github "gimp",            "1.0.1"
github "inkscape",        "1.0.4", :repo => "maarc/puppet-inkscape"

github "mymissingmodules", "1.0.13", :repo => "maarc/puppet-mymissingmodules"

# issues ...
github "transmit",        "1.0.3", :repo => "maarc/puppet-transmit"
github "tor",             "1.0.2"
github "eclipse",         "2.5.0"


# MAYBE
#github "slate",           "1.0.25"
#github "chrome",          "1.1.2"
#github "zsh",             "1.0.0"

# NO GO
#github "flowdock",        "1.0.0"
