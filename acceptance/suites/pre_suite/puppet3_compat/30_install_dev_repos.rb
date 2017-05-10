install_opts = options.merge( { :dev_builds_repos => ["PC1"] })

case test_config[:puppetserver_install_type]
when :package
  step "Setup Puppet Server dev repository on the master." do
    package_build_version = ENV['PACKAGE_BUILD_VERSION']
    if package_build_version
      install_puppetlabs_dev_repo(master, 'puppetserver', package_build_version,
                                  nil, install_opts)
    else
      abort("Environment variable PACKAGE_BUILD_VERSION required for package installs!")
    end
  end

  step "Setup Puppet dev repository on the master." do
    install_puppetlabs_dev_repo(master, 'puppet-agent', test_config[:puppet_build_version],
                                repo_config_dir, install_opts)
  end
end
