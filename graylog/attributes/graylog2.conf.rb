# If you are running more than one instances of graylog2-server you have to select one of these
# instances as master. The master will perform some periodical tasks that non-masters won't perform.
default['graylog']['server']['graylog2.conf']['is_master'] = true

# The auto-generated node ID will be stored in this file and read after restarts. It is a good idea
# to use an absolute file path here if you are starting graylog2-server from init scripts or similar.
default['graylog']['server']['graylog2.conf']['node_id_file'] = '/etc/graylog2-server-node-id'

# You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters.
# Generate one by using for example: pwgen -s 96
default['graylog']['server']['graylog2.conf']['password_secret'] = nil

# the default root user is named 'admin'
# root_username = admin
# You MUST specify a hash password for the root user (which you only need to initially set up the
# system and in case you lose connectivity to your authentication backend)
# This password cannot be changed using the API or via the web interface.
# Create one by using for example: "echo -n yourpassword | shasum -a 256"
default['graylog']['server']['graylog2.conf']['root_password_sha2'] = nil

# Set plugin directory here (relative or absolute)
default['graylog']['server']['graylog2.conf']['plugin_dir'] = 'plugin'

# REST API listen URI. Must be reachable by other graylog2-server nodes if you run a cluster.
default['graylog']['server']['graylog2.conf']['rest_listen_uri'] = 'http://127.0.0.1:12900/'

# REST API transport address. Defaults to the value of rest_listen_uri. Exception: If rest_listen_uri
# is set to a wildcard IP address (0.0.0.0) the first non-loopback IPv4 system address is used.
# This will be promoted in the cluster discovery APIs and other nodes may try to connect on this
# address. (see rest_listen_uri)
default['graylog']['server']['graylog2.conf']['rest_transport_uri'] = nil

# Enable CORS headers for REST api. This is necessary for JS-clients accessing the server directly.
# If these are disabled, modern browsers will not be able to retrieve resources from the server.
default['graylog']['server']['graylog2.conf']['rest_enable_cors'] = nil

# Enable GZIP support for REST api. This compresses API responses and therefore helps to reduce
# overall round trip times.
default['graylog']['server']['graylog2.conf']['rest_enable_gzip'] = nil

# Embedded elasticsearch configuration file
# pay attention to the working directory of the server, maybe use an absolute path here
default['graylog']['server']['graylog2.conf']['elasticsearch_config_file'] = nil

# (Approximate) maximum number of documents in an Elasticsearch index before a new index
# is being created, also see no_retention and elasticsearch_max_number_of_indices.
default['graylog']['server']['graylog2.conf']['elasticsearch_max_docs_per_index'] = 20_000_000

# How many indices do you want to keep?
# elasticsearch_max_number_of_indices*elasticsearch_max_docs_per_index=total number of messages in your setup
default['graylog']['server']['graylog2.conf']['elasticsearch_max_number_of_indices'] = 20

# Decide what happens with the oldest indices when the maximum number of indices is reached.
# The following strategies are availble:
#   - delete # Deletes the index completely (Default)
#   - close # Closes the index and hides it from the system. Can be re-opened later.
default['graylog']['server']['graylog2.conf']['retention_strategy'] = 'delete'

# How many ElasticSearch shards and replicas should be used per index? Note that this only applies to newly created indices.
default['graylog']['server']['graylog2.conf']['elasticsearch_shards'] = 4
default['graylog']['server']['graylog2.conf']['elasticsearch_replicas'] = 0

# Prefix for all Elasticsearch indices and index aliases managed by Graylog2.
default['graylog']['server']['graylog2.conf']['elasticsearch_index_prefix'] = 'graylog2'

# Do you want to allow searches with leading wildcards? This can be extremely resource hungry and should only
# be enabled with care. See also: http://support.torch.sh/help/kb/graylog2-web-interface/the-search-bar-explained
default['graylog']['server']['graylog2.conf']['allow_leading_wildcard_searches'] = false

# Do you want to allow searches to be highlighted? Depending on the size of your messages this can be memory hungry and
# should only be enabled after making sure your elasticsearch cluster has enough memory.
default['graylog']['server']['graylog2.conf']['allow_highlighting'] = false

# settings to be passed to elasticsearch's client (overriding those in the provided elasticsearch_config_file)
# all these
# this must be the same as for your elasticsearch cluster
default['graylog']['server']['graylog2.conf']['elasticsearch_cluster_name'] = node['graylog']['elasticsearch']['cluster_name']

# you could also leave this out, but makes it easier to identify the graylog2 client instance
default['graylog']['server']['graylog2.conf']['elasticsearch_node_name'] = nil

# we don't want the graylog2 server to store any data, or be master node
default['graylog']['server']['graylog2.conf']['elasticsearch_node_master'] = nil
default['graylog']['server']['graylog2.conf']['elasticsearch_node_data'] = nil

# use a different port if you run multiple elasticsearch nodes on one machine
default['graylog']['server']['graylog2.conf']['elasticsearch_transport_tcp_port'] = nil
# we don't need to run the embedded HTTP server here
default['graylog']['server']['graylog2.conf']['elasticsearch_http_enabled'] = nil

# Disable multicast, specify elasticsearch hosts to connect to (recommended for production)
# See: http://support.torch.sh/help/kb/graylog2-server/configuring-and-tuning-elasticsearch-for-graylog2-v0200
default['graylog']['server']['graylog2.conf']['elasticsearch_discovery_zen_ping_multicast_enabled'] = false
default['graylog']['server']['graylog2.conf']['elasticsearch_discovery_zen_ping_unicast_hosts'] = "#{node['graylog']['elasticsearch']['host']}:#{node['graylog']['elasticsearch']['port']}"

# the following settings allow to change the bind addresses for the elasticsearch client in graylog2
# these settings are empty by default, letting elasticsearch choose automatically,
# override them here or in the 'elasticsearch_config_file' if you need to bind to a special address
# refer to http://www.elasticsearch.org/guide/en/elasticsearch/reference/0.90/modules-network.html for special values here
default['graylog']['server']['graylog2.conf']['elasticsearch_network_host'] = nil
default['graylog']['server']['graylog2.conf']['elasticsearch_network_bind_host'] = nil
default['graylog']['server']['graylog2.conf']['elasticsearch_network_publish_host'] = nil

# The total amount of time discovery will look for other Elasticsearch nodes in the cluster
# before giving up and declaring the current node master.
default['graylog']['server']['graylog2.conf']['elasticsearch_discovery_initial_state_timeout'] = nil

# Analyzer (tokenizer) to use for message and full_message field. The "standard" filter usually is a good idea.
# All supported analyzers are: standard, simple, whitespace, stop, keyword, pattern, language, snowball, custom
# ElasticSearch documentation: http://www.elasticsearch.org/guide/reference/index-modules/analysis/
# Note that this setting only takes effect on newly created indices.
default['graylog']['server']['graylog2.conf']['elasticsearch_analyzer'] = 'standard'

# Batch size for the ElasticSearch output. This is the maximum (!) number of messages the ElasticSearch output
# module will get at once and write to ElasticSearch in a batch call. If the configured batch size has not been
# reached within output_flush_interval seconds, everything that is available will be flushed at once. Remember
# that every outputbuffer processor manages its own batch and performs its own batch write calls.
# ("outputbuffer_processors" variable)
default['graylog']['server']['graylog2.conf']['output_batch_size'] = 25

# Flush interval (in seconds) for the ElasticSearch output. This is the maximum amount of time between two
# batches of messages written to ElasticSearch. It is only effective at all if your minimum number of messages
# for this time period is less than output_batch_size * outputbuffer_processors.
default['graylog']['server']['graylog2.conf']['output_flush_interval'] = 1

# The number of parallel running processors.
# Raise this number if your buffers are filling up.
default['graylog']['server']['graylog2.conf']['processbuffer_processors'] = 5
default['graylog']['server']['graylog2.conf']['outputbuffer_processors'] = 3

default['graylog']['server']['graylog2.conf']['outputbuffer_processor_keep_alive_time'] = nil
default['graylog']['server']['graylog2.conf']['outputbuffer_processor_threads_core_pool_size'] = nil
default['graylog']['server']['graylog2.conf']['outputbuffer_processor_threads_max_pool_size'] = nil

# UDP receive buffer size for all message inputs (e. g. SyslogUDPInput).
default['graylog']['server']['graylog2.conf']['udp_recvbuffer_sizes'] = nil

# Wait strategy describing how buffer processors wait on a cursor sequence. (default: sleeping)
# Possible types:
#  - yielding
#     Compromise between performance and CPU usage.
#  - sleeping
#     Compromise between performance and CPU usage. Latency spikes can occur after quiet periods.
#  - blocking
#     High throughput, low latency, higher CPU usage.
#  - busy_spinning
#     Avoids syscalls which could introduce latency jitter. Best when threads can be bound to specific CPU cores.
default['graylog']['server']['graylog2.conf']['processor_wait_strategy'] = 'blocking'

# Size of internal ring buffers. Raise this if raising outputbuffer_processors does not help anymore.
# For optimum performance your LogMessage objects in the ring buffer should fit in your CPU L3 cache.
# Start server with --statistics flag to see buffer utilization.
# Must be a power of 2. (512, 1024, 2048, ...)
default['graylog']['server']['graylog2.conf']['ring_size'] = 1024

# EXPERIMENTAL: Dead Letters
# Every failed indexing attempt is logged by default and made visible in the web-interface. You can enable
# the experimental dead letters feature to write every message that was not successfully indexed into the
# MongoDB "dead_letters" collection to make sure that you never lose a message. The actual writing of dead
# letter should work fine already but it is not heavily tested yet and will get more features in future
# releases.
default['graylog']['server']['graylog2.conf']['dead_letters_enabled'] = false

# How many seconds to wait between marking node as DEAD for possible load balancers and starting the actual
# shutdown process. Set to 0 if you have no status checking load balancers in front.
default['graylog']['server']['graylog2.conf']['lb_recognition_period_seconds'] = 3

# Every message is matched against the configured streams and it can happen that a stream contains rules which
# take an unusual amount of time to run, for example if its using regular expressions that perform excessive backtracking.
# This will impact the processing of the entire server. To keep such misbehaving stream rules from impacting other
# streams, Graylog2 limits the execution time for each stream.
# The default values are noted below, the timeout is in milliseconds.
# If the stream matching for one stream took longer than the timeout value, and this happened more than "max_faults" times
# that stream is disabled and a notification is shown in the web interface.
default['graylog']['server']['graylog2.conf']['stream_processing_timeout'] = 2000
default['graylog']['server']['graylog2.conf']['stream_processing_max_faults'] = nil

# Since 0.21 the graylog2 server supports pluggable output modules. This means a single message can be written to multiple
# outputs. The next setting defines the timeout for a single output module, including the default output module where all
# messages end up. This setting is specified in milliseconds.

# Time in milliseconds to wait for all message outputs to finish writing a single message.
default['graylog']['server']['graylog2.conf']['output_module_timeout'] = nil

# Time in milliseconds after which a detected stale master node is being rechecked on startup.
default['graylog']['server']['graylog2.conf']['stale_master_timeout'] = nil

# Time in milliseconds which Graylog2 is waiting for all threads to stop on shutdown.
default['graylog']['server']['graylog2.conf']['shutdown_timeout'] = nil

# MongoDB Configuration
default['graylog']['server']['graylog2.conf']['mongodb_useauth'] = false
default['graylog']['server']['graylog2.conf']['mongodb_user'] = nil
default['graylog']['server']['graylog2.conf']['mongodb_password'] = nil
default['graylog']['server']['graylog2.conf']['mongodb_host'] = '127.0.0.1'
default['graylog']['server']['graylog2.conf']['mongodb_replica_set'] = nil
default['graylog']['server']['graylog2.conf']['mongodb_database'] = 'graylog2'
default['graylog']['server']['graylog2.conf']['mongodb_port'] = 27_017

# Raise this according to the maximum connections your MongoDB server can handle if you encounter MongoDB connection problems.
default['graylog']['server']['graylog2.conf']['mongodb_max_connections'] = 100

# Number of threads allowed to be blocked by MongoDB connections multiplier. Default: 5
# If mongodb_max_connections is 100, and mongodb_threads_allowed_to_block_multiplier is 5, then 500 threads can block. More than that and an exception will be thrown.
# http://api.mongodb.org/java/current/com/mongodb/MongoOptions.html#threadsAllowedToBlockForConnectionMultiplier
default['graylog']['server']['graylog2.conf']['mongodb_threads_allowed_to_block_multiplier'] = 5

# Drools Rule File (Use to rewrite incoming log messages)
# See: http://support.torch.sh/help/kb/graylog2-server/custom-message-rewritingprocessing
default['graylog']['server']['graylog2.conf']['rules_file'] = nil

# Email transport
default['graylog']['server']['graylog2.conf']['transport_email_enabled'] = false
default['graylog']['server']['graylog2.conf']['transport_email_hostname'] = 'mail.example.com'
default['graylog']['server']['graylog2.conf']['transport_email_port'] = 587
default['graylog']['server']['graylog2.conf']['transport_email_use_auth'] = true
default['graylog']['server']['graylog2.conf']['transport_email_use_tls'] = true
default['graylog']['server']['graylog2.conf']['transport_email_use_ssl'] = true
default['graylog']['server']['graylog2.conf']['transport_email_auth_username'] = 'you@example.com'
default['graylog']['server']['graylog2.conf']['transport_email_auth_password'] = 'secret'
default['graylog']['server']['graylog2.conf']['transport_email_subject_prefix'] = '[graylog2]'
default['graylog']['server']['graylog2.conf']['transport_email_from_email'] = 'graylog2@example.com'

# Specify and uncomment this if you want to include links to the stream in your stream alert mails.
# This should define the fully qualified base url to your web interface exactly the same way as it is accessed by your users.
default['graylog']['server']['graylog2.conf']['transport_email_web_interface_url'] = nil

# HTTP proxy for outgoing HTTP calls
default['graylog']['server']['graylog2.conf']['http_proxy_uri'] = nil

# Switch to enable/disable the off-heap message cache. Stores cached messages in the spool directory if set to true.
# Stores the messages in an in-memory data structure if set to false.
default['graylog']['server']['graylog2.conf']['message_cache_off_heap'] = nil

# Directory for the off-heap message cache data. (absolute or relative)
# Default to /var/spool/graylog2, as /usr/local is not writeable
default['graylog']['server']['graylog2.conf']['message_cache_spool_dir'] = '/var/spool/graylog2'

# The commit interval for the message cache in milliseconds. Only affects message cache implementations that need to commit data.
default['graylog']['server']['graylog2.conf']['message_cache_commit_interval'] = nil

# When more messages are coming in as we can process, incoming messages will be cached in memory until
# they are ready to be processed. Per default this data structure is unbounded, so in situations of
# constant high load, it will grow endlessly until all allocatable memory has been consumed and the
# process dies.
# To prevent this, the next setting allows you to define an upper bound for this memory cache, if the
# number of messages in the cache has reached this limit, incoming messages will be dropped until it
# has shrunk again.
#
# The default is 0, which means no upper bound.
#
default['graylog']['server']['graylog2.conf']['input_cache_max_size'] = nil

# Connection timeout for a configured LDAP server (e. g. ActiveDirectory) in milliseconds.
default['graylog']['server']['graylog2.conf']['ldap_connection_timeout'] = nil

# Version checks settings. All timeouts are in milliseconds.
default['graylog']['server']['graylog2.conf']['versionchecks'] = nil
default['graylog']['server']['graylog2.conf']['versionchecks_uri'] = nil
default['graylog']['server']['graylog2.conf']['versionchecks_connection_request_timeout'] = nil
default['graylog']['server']['graylog2.conf']['versionchecks_connect_timeout'] = nil
default['graylog']['server']['graylog2.conf']['versionchecks_socket_timeout'] = nil

# https://github.com/bazhenov/groovy-shell-server
default['graylog']['server']['graylog2.conf']['groovy_shell_enable'] = nil
default['graylog']['server']['graylog2.conf']['groovy_shell_port'] = nil

# Enable collection of Graylog2-related metrics into MongoDB
default['graylog']['server']['graylog2.conf']['enable_metrics_collection'] = nil
