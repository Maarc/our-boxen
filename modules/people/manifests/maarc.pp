class people::maarc {
  # Note: in order to reinstall / delete an app, remove the corresponding file in /var/db/.puppet_appdmg_installed_APPLICATIONNAME

  # TODO add Fuse for osx http://sourceforge.net/projects/osxfuse/files/osxfuse-2.7.5/osxfuse-2.7.5.dmg/download
  # persist firefox bookmarks / sublime configuration
  # TODO - add FreeDiskSpace
  # TODO - add Quartz and Inkscape 
  # TODO - add Libreoffice (version < 4.4.0 e.g. 4.3.5 ... only the stable one ...) 
  # TODO - add Fantastical https://flexibits.com/fantastical
  # TODO - add transmit
  # TODO - add chrome

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

  # Note ... brew repository is in '/opt/boxen/homebrew/'
  # Do git status ... to consider changes
  include homebrew
  # FIXME issue with this package ... package { 'htop-osx': ensure => 'present'}
  # Note for bash install ... https://gist.github.com/samnang/1759336 and https://stackoverflow.com/questions/16416195/how-do-i-upgrade-bash-in-mac-osx-mountain-lion-and-set-it-the-correct-path
  package { 'bash': ensure => 'present'}
  package { 'maven': ensure => 'present'}
  package { 'pstree': ensure => 'present'}
  package { 'gs': ensure => 'present'}
  package { 'watch': ensure => 'present'}
  package { 'graphviz': ensure => 'present'}
  package { 'docker': ensure => 'present'}
  package { 'boot2docker': ensure => 'present'}
  # https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
  package { 'bash-completion': ensure => 'present'}
  package { 'git': ensure => 'present'}
  
  class { 'intellij': edition => 'ultimate', version => '14.0.2' }

  ####### NodeJS

  # include short version aliases
  nodejs::version { 'v0.12.0': }

  # set the global nodejs version
  class { 'nodejs::global': version => 'v0.12.0' }

  # install some npm modules
  nodejs::module { 'bower': node_version => 'v0.12.0'}
  nodejs::module { 'yo': node_version => 'v0.12.0'}
  nodejs::module { 'grunt-cli': node_version => 'v0.12.0'}
  nodejs::module { 'grunt': node_version => 'v0.12.0'}
  nodejs::module { 'gulp': node_version => 'v0.12.0'}
  nodejs::module { 'generator-webapp': node_version => 'v0.12.0'}
  nodejs::module { 'grunt-bower-requirejs': node_version => 'v0.12.0'}
  nodejs::module { 'generator-jhipster': node_version => 'v0.12.0'}

  include mymissingmodules::jd

  ####### Sublime Text

  include sublime_text

  sublime_text::package { 'Emmet': source => 'sergeche/emmet-sublime'}
  # already declared ... sublime_text::package { 'Package Control': source => 'wbond/package_control'}
  sublime_text::package { 'Markdown Extended': source => 'jonschlinkert/sublime-markdown-extended'}
  sublime_text::package { 'Markdown Preview': source => 'revolunet/sublimetext-markdown-preview'}
  sublime_text::package { 'SideBarEnhancements': source => 'titoBouzout/SideBarEnhancements'}
  sublime_text::package { 'BracketHighlighter': source => 'facelessuser/BracketHighlighter'}
  sublime_text::package { 'Dictionaries': source => 'titoBouzout/Dictionaries'}
  sublime_text::package { 'Indent XML': source => 'alek-sys/sublimetext_indentxml'}

  
  ############################################################
  # Virtualization
  ############################################################

  # http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html
  class { 'virtualbox':
    version => '4.3.20',
    patch_level => '96996'
  }

  class { 'vagrant':
    version => '1.7.2'
  }


  ############################################################
  # Applications
  ############################################################

  include mymissingmodules::cleanmymac
  include mymissingmodules::handsoff
  include mymissingmodules::pathfinder
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

  class { 'vlc':
    version => '2.1.5'
  }

  class { 'appcleaner':
    version => '2.3'
  }

  class { 'adobe_reader':
    version => '11.0.10'
  }

  # https://www.mozilla.org/en-US/firefox/releases/
  # https://download.mozilla.org/?product=firefox-35.0-SSL&os=osx&lang=en-US
  # TODO ... combine plugin installation ... with http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts
  class { 'firefox':
    # version => '36.0.0', => the latest version from release channel will be used
    locale => 'en-US'
  }

  class { 'things':
    version => '2.5.3'
  }

  # https://www.dropbox.com/release_notes
  class { 'dropbox':
    version => '3.2.6'
  }


  ###################### Not working so far ...


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

  # Not completely working
  #class { 'eclipse::jee':
  #  version => 'SR1a'
  #}

  #####################################################################################################################################


  # Note - https://davidwinter.me/simple-local-web-development-with-apache-and-dnsmasq/

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
