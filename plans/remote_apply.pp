plan puppet_applier::remote_apply
(
  $nodes = 'petersouter.co.uk'
)
{

  $remote_apply_run = run_task('puppet_applier::apply', $nodes, modulepath => "/var/tmp")

  if($remote_apply_run.ok) {
    util::print("Successfull ${remote_apply_run}")
  } else {
    util::print("Failed ${remote_apply_run}")
  }

}
