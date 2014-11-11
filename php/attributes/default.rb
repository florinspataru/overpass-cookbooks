default['php']['composer']['url'] = "http://getcomposer.org/composer.phar"
default['php']['composer']['bin'] = "/usr/local/bin/composer"
default['php']['phpunit']['url'] = "https://phar.phpunit.de/phpunit.phar"
default['php']['phpunit']['bin'] = "/usr/local/bin/phpunit"
default['php']['ext_conf_dir'] = "/etc/php5/fpm/conf.d"

#xdebug

# XDEBUG.INI OPTIONS
default[:xdebug][:auto_trace]                = 0
default[:xdebug][:cli_color]                 = 0
default[:xdebug][:collect_assignments]       = 0
default[:xdebug][:collect_includes]          = 1
default[:xdebug][:collect_params]            = 0
default[:xdebug][:collect_return]            = 0
default[:xdebug][:collect_vars]              = 0
default[:xdebug][:coverage_enable]           = 1
default[:xdebug][:default_enable]            = 1
#default['xdebug']['dump.*']                 = Empty
default[:xdebug][:dump_globals]              = 1
default[:xdebug][:dump_undefined]            = 0
default[:xdebug][:extended_info]             = 1
default[:xdebug][:file_link_format]          = ''
#default[:xdebug][:idekey]                   = *complex*
default[:xdebug][:manual_url]                = 'http://www.php.net'
default[:xdebug][:max_nesting_level]         = 100
default[:xdebug][:overload_var_dump]         = 1
default[:xdebug][:profiler_append]           = 0
default[:xdebug][:profiler_enable]           = 1
default[:xdebug][:profiler_enable_trigger]   = 1
default[:xdebug][:profiler_output_dir]       = '/tmp'
default[:xdebug][:profiler_output_name]      = 'cachegrind.out.%p'
default[:xdebug][:remote_autostart]          = 1
default[:xdebug][:remote_connect_back]       = 1
default[:xdebug][:remote_cookie_expire_time] = 3600
default[:xdebug][:remote_enable]             = 1
default[:xdebug][:remote_handler]            = 'dbgp'
default[:xdebug][:remote_host]               = '33.33.33.0'
default[:xdebug][:remote_log]                = '/tmp/php5-xdebug.log'
default[:xdebug][:remote_mode]               = 'req'
default[:xdebug][:remote_port]               = 9000
default[:xdebug][:scream]                    = 0
default[:xdebug][:show_exception_trace]      = 0
default[:xdebug][:show_local_vars]           = 0
default[:xdebug][:show_mem_delta]            = 0
default[:xdebug][:trace_enable_trigger]      = 0
default[:xdebug][:trace_format]              = 0
default[:xdebug][:trace_options]             = 0
default[:xdebug][:trace_output_dir]          = '/tmp'
default[:xdebug][:trace_output_name]         = 'trace.%c'
default[:xdebug][:var_display_max_children]  = 128
default[:xdebug][:var_display_max_data]      = 512
default[:xdebug][:var_display_max_depth]     = 3