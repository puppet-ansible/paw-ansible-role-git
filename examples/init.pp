# Example usage of paw_ansible_role_git

# Simple include with default parameters
include paw_ansible_role_git

# Or with custom parameters:
# class { 'paw_ansible_role_git':
#   workspace => '/root',
#   git_enablerepo => undef,
#   git_packages => ['git'],
#   git_install_from_source => false,
#   git_install_path => '/usr',
#   git_version => '2.26.0',
#   git_install_from_source_force_update => false,
#   git_reinstall_from_source => false,
# }
