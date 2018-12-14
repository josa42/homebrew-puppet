cask 'puppet-agent' do
  version '6.0.0-1'
  sha256 'eecb5caac515465e5e3475757df7765974d22b57b5d67b9fbc13a247ad768555'
  url "https://downloads.puppetlabs.com/mac/puppet/10.13/x86_64/puppet-agent-#{version}.osx10.13.dmg"
  name 'Puppet Agent'
  homepage "https://docs.puppet.com/puppet/#{version.major_minor}/about_agent.html"
  depends_on macos: '>= :high_sierra'
  pkg "puppet-agent-#{version}-installer.pkg"
  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                         'mcollective',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'
  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
