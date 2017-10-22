plan puppet_applier::remote_apply
(
  String                           $server,
  String                           $modules_upload,
)
{


  file_upload($modules_upload, "/tmp/puppet_applier_modules/", $server)

  $remote_apply_run = run_task('puppet_applier::apply', $server, { modulepath => "/tmp/puppet_applier_modules/",
    code => "notify { 'Hello World' : }"})

  if($remote_apply_run.ok) {
    notice("Successful ${remote_apply_run}")
  } else {
    notice("Failed ${remote_apply_run}")
  }

}
