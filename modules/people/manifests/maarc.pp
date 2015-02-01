class people::maarc {


  ############################################################
  # OS X
  ############################################################

  include osx::global::expand_save_dialog
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  include osx::no_network_dsstores

  include osx::software_update

  class { 'osx::dock::position':
    position => 'bottom'
  }

  class { 'osx::dock::hot_corners':
    bottom_left => "Start Screen Saver",
    top_right => ""
  }

  class { 'osx::sound::interface_sound_effects':
    enable => false
  }

  # http://www.titanium.free.fr/onyx.html
  #class { 'onyx':
  #  version => '2.9.4'
  #}  

  include fonts

  ############################################################
  # Development
  ############################################################

  # 1.7u71 (jdk+jre)
  include java

  include sourcetree
  include homebrew
  package { 'maven': ensure => 'present'}
  package { 'pstree': ensure => 'present'}
  # issue ... checked every time ...
  #package { 'htop': ensure => 'present'}

  ############################################################
  # Applications
  ############################################################

  include mymissingmodules::cleanmymac
  include mymissingmodules::handsoff
  include mymissingmodules::pathfinder
  include mymissingmodules::jd
  # issue: no working
  #include mymissingmodules::wireshark

  include wget
  include skype
  include evernote
  include alfred
  include spotify
  include onepassword
  include iterm2::stable
  include jmeter
  include nmap
  include dia
  include gimp
  include inkscape

  # TODO ... fix missing and add SOAP-UI / elastic-search / ... add crashplan / kindle and parallels

  # Issue as unzipping
  #include transmit

  # 4.3.5 - default language is 'de'
  include libreoffice
  include libreoffice::languagepack

  # issue unzipping
  #class { 'tor':
  #  version => '4.0.3‚'
  #}

  class { 'vagrant':
    version => '1.7.2'
  }

  include sublime_text
    sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  class { 'vlc':
    version => '2.1.5'
  }

  class { 'appcleaner':
    version => '2.3'
  }

  class { 'adobe_reader':
    version => '11.0.10'
  }

  # https://www.dropbox.com/release_notes
  class { 'dropbox':
    version => '3.0.5'
  }

  # http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html
  class { 'virtualbox':
    version => '4.3.20',
    patch_level => '96996'
  }

  # https://www.mozilla.org/en-US/firefox/releases/
  # https://download.mozilla.org/?product=firefox-35.0-SSL&os=osx&lang=en-US
  # TODO ... combine plugin installation ... with http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts
  class { 'firefox':
    version => '35.0',
    locale => 'en-US'
  }

  class { 'things':
    version => '2.5.2'
  }

  class { 'intellij':
    edition => 'ultimate',
    version => '14.0.2'
  }

  # Not completely working
  #class { 'eclipse::jee':
  #  version => 'SR1a'
  #}

  # Note - https://davidwinter.me/simple-local-web-development-with-apache-and-dnsmasq/

  #####################################################################################################################################

  #$my_home  = "/Users/${::luser}"
  #$projects = "${my_home}/vagrant/code/rozza"
  #
  #file { $projects:
  #  ensure => directory,
  #}
  #
  #$dotfiles = "${projects}/dotfiles"
  #
  #repository { $dotfiles:
  #  source  => 'rozza/dotfiles',
  #  require => File[$projects],
  #  notify  => Exec['rozza-make-dotfiles'],
  #}
  #
  #exec { 'rozza-make-dotfiles':
  #  command     => "cd ${dotfiles} && make",
  #  refreshonly => true,
  #}
}