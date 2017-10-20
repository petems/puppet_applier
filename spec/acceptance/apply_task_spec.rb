# run a test task
require 'spec_helper_acceptance'

describe 'apply task' do
  describe 'apply' do
    it 'execute puppet apply' do
      result = run_task(task_name: 'puppet_applier::apply', params: 'modulepath="/var/tmp"')
      expect_multiple_regexes(result: result, regexes: [%r{Configured lockfile setting is /opt/puppetlabs/puppet/cache/state/agent_catalog_run.lock}, %r{Ran on 1 node in .+ seconds}])
    end
  end
end
