# State of the log_transfer module. While active, the uXRCE-DDS client stops
# sending publications not marked keep_when_gated so the serial link is free
# for the download. Published at least once per second while a session is open.

uint64 timestamp        # time since system start (microseconds)

bool active             # a transfer session is open
uint8 session           # token of the active session
uint16 file_index       # file currently open, if any
uint32 bytes_sent       # payload bytes sent in this session
uint32 blocks_sent      # chunks sent in this session
