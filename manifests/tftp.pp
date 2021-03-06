# Class: razor::tftp
#
# Actions:
#
#   Manages tftp service and files for razor.
#
class razor::tftp {
  include tftp

  tftp::file { [ 'pxelinux.0',
                 'menu.c32',
                 'ipxe.iso',
                 'ipxe.lkrn' ]:
  }

  tftp::file { 'pxelinux.cfg':
    ensure  => directory,
    source  => 'puppet:///modules/razor/pxelinux.cfg',
    recurse => true,
  }

  tftp::file { 'razor.ipxe':
    content => template('razor/razor.ipxe.erb'),
  }
}
