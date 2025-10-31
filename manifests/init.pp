# paw_ansible_role_git
# @summary Manage paw_ansible_role_git configuration
#
# @param workspace
# @param git_enablerepo will be installed.
# @param git_packages
# @param git_install_from_source the 'git_version' variable instead of using a package.
# @param git_install_path
# @param git_version
# @param git_install_from_source_force_update Only applies if git_install_from_source is `true`.
# @param git_reinstall_from_source Leave this at it's default.
# @param par_tags An array of Ansible tags to execute (optional)
# @param par_skip_tags An array of Ansible tags to skip (optional)
# @param par_start_at_task The name of the task to start execution at (optional)
# @param par_limit Limit playbook execution to specific hosts (optional)
# @param par_verbose Enable verbose output from Ansible (optional)
# @param par_check_mode Run Ansible in check mode (dry-run) (optional)
# @param par_timeout Timeout in seconds for playbook execution (optional)
# @param par_user Remote user to use for Ansible connections (optional)
# @param par_env_vars Additional environment variables for ansible-playbook execution (optional)
# @param par_logoutput Control whether playbook output is displayed in Puppet logs (optional)
# @param par_exclusive Serialize playbook execution using a lock file (optional)
class paw_ansible_role_git (
  String $workspace = '/root',
  Optional[String] $git_enablerepo = undef,
  Array $git_packages = ['git'],
  Boolean $git_install_from_source = false,
  String $git_install_path = '/usr',
  String $git_version = '2.26.0',
  Boolean $git_install_from_source_force_update = false,
  Boolean $git_reinstall_from_source = false,
  Optional[Array[String]] $par_tags = undef,
  Optional[Array[String]] $par_skip_tags = undef,
  Optional[String] $par_start_at_task = undef,
  Optional[String] $par_limit = undef,
  Optional[Boolean] $par_verbose = undef,
  Optional[Boolean] $par_check_mode = undef,
  Optional[Integer] $par_timeout = undef,
  Optional[String] $par_user = undef,
  Optional[Hash] $par_env_vars = undef,
  Optional[Boolean] $par_logoutput = undef,
  Optional[Boolean] $par_exclusive = undef
) {
  # Execute the Ansible role using PAR (Puppet Ansible Runner)
  $vardir = pick($facts['puppet_vardir'], $settings::vardir, '/opt/puppetlabs/puppet/cache')
  $playbook_path = "${vardir}/lib/puppet_x/ansible_modules/ansible_role_git/playbook.yml"

  par { 'paw_ansible_role_git-main':
    ensure        => present,
    playbook      => $playbook_path,
    playbook_vars => {
      'workspace'                            => $workspace,
      'git_enablerepo'                       => $git_enablerepo,
      'git_packages'                         => $git_packages,
      'git_install_from_source'              => $git_install_from_source,
      'git_install_path'                     => $git_install_path,
      'git_version'                          => $git_version,
      'git_install_from_source_force_update' => $git_install_from_source_force_update,
      'git_reinstall_from_source'            => $git_reinstall_from_source,
    },
    tags          => $par_tags,
    skip_tags     => $par_skip_tags,
    start_at_task => $par_start_at_task,
    limit         => $par_limit,
    verbose       => $par_verbose,
    check_mode    => $par_check_mode,
    timeout       => $par_timeout,
    user          => $par_user,
    env_vars      => $par_env_vars,
    logoutput     => $par_logoutput,
    exclusive     => $par_exclusive,
  }
}
