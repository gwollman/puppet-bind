define bind::zone::master ($zone = $name, $view, $source, 
			   $inline_signing = false,
			   $allow_transfer = undef, $notify_ = undef,
			   $also_notify = undef,
			   ) {
  include bind::config
  $key_directory = $bind::config::key_directory

  bind::zone::generic {$zone:
    zone_type      => master,
    zone_file      => $source,
    allow_transfer => $allow_transfer,
    notify_        => $notify_,
    also_notify    => $also_notify,
    order          => "55",
    content        => template('bind/master.conf.erb'),
  }
}
