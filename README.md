# lockfile_tasks

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with lockfile_tasks](#setup)
    * [What lockfile_tasks affects](#what-lockfile_tasks-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with lockfile_tasks](#beginning-with-lockfile_tasks)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module contains tasks to manage and delete Puppet lockfiles on nodes

In the future, this would then allows you to delete the lockfile is needed, checking whether the lockfile is old enough to be stale, and seeing if any Puppet processes are running in the background.

There are a few scenarios where this is neccasary:

* A puppet agent process is killed ungracefully (such as with a `kill -9`), which left the old lockfile in place.
* A system hard-rebooted mid Puppet run
* A network issue causes a hung connection to the Puppet master (such as https://tickets.puppetlabs.com/browse/PUP-7517)

## Setup

### What lockfile_tasks affects

This task modifies the Puppet lockfile (Generally `/opt/puppetlabs/puppet/cache/state/agent_catalog_run.lock`)

### Setup Requirements

Relies on Puppet being installed on the target nodes.

### Beginning with lockfile_tasks

Ensure Puppet is installed on the target nodes.

## Usage

This task requires no input and only supplies a simple output.

## Reference

lockfile_tasks has no variables or customisation.

## Limitations

Tested on Linux and Windows.

## Development

To test on a local Vagrant VM:

```bash
vagrant up
vagrant ssh-config >> ~/.ssh/config
bolt task run lockfile_tasks --nodes lockfile-tasks.puppet.vm --user vagrant
```

You can also run a quick beaker check:

```
BEAKER_set='ubuntu-1604-docker' bundle exec rspec spec/acceptance/lockfile_details_spec.rb
```

Contribution is welcome.


## Release Notes/Contributors/Etc.

This is the initial release
