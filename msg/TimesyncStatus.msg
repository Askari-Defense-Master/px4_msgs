uint64 timestamp			# time since system start (microseconds)

uint8 SOURCE_PROTOCOL_UNKNOWN = 0
uint8 SOURCE_PROTOCOL_MAVLINK = 1
uint8 SOURCE_PROTOCOL_DDS     = 2
uint8 source_protocol			# timesync source

uint64 remote_timestamp			# remote system timestamp (microseconds)
int64 observed_offset			# raw time offset directly observed from this timesync packet (microseconds)
int64 estimated_offset			# smoothed time offset between companion system and PX4 (microseconds)
uint32 round_trip_time			# round trip time of this timesync packet (microseconds)

# Log association and wall-clock reference. Unlike `timestamp`, these are never
# shifted into the companion's clock by the uXRCE-DDS bridge.
uint64 boot_time_us			# same instant as timestamp, always time since system start (microseconds). This is the ULog time axis
uint64 utc_time_us			# GNSS UTC time at that instant (microseconds), 0 if not known yet
uint32 boot_id				# random value chosen once per boot, identifies which boot (and so which ULog) boot_time_us belongs to
