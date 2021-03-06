# Class: jenkins
# ===========================
#
# Full description of class jenkins here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'jenkins':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name Jawad Hussain
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class jenkins {
   file {'/tmp/jdk-8u161-linux-x64.rpm':
         source => 'puppet:///modules/jenkins/jdk-8u161-linux-x64.rpm',
        }
   package {'jdk-8u161-linux-x64.rpm':
         ensure => 'present',
         provider => 'rpm',
         source => '/tmp/jdk-8u161-linux-x64.rpm'
        }
   file {'/tmp/setup.ksh':
         ensure => 'file',
         source => 'puppet:///modules/jenkins/setup.ksh',
         mode => '0755',
        }
   exec {'/tmp/setup.ksh':
         user => 'root',
        }
  package {'jenkins':
         ensure => 'present',
         provider => 'yum',
       } 
}
