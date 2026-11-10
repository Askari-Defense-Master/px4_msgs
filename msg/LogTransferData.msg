# Reply from the log_transfer module: directory entries, file info and file
# chunks of a ULog download. Published on /fmu/out/log_transfer_data.
# One sample must stay within the 512-byte uXRCE-DDS serial MTU: 12 bytes of
# XRCE headers + 24 bytes of fields (incl. padding) + BLOCK_SIZE bytes of payload = 508.

uint64 timestamp        # time since system start (microseconds)

uint8 KIND_ENTRY = 0     # OP_LIST reply: data = "<dir>/<file>" (NUL terminated), offset = file size, file_index = ordinal
uint8 KIND_LIST_END = 1  # OP_LIST finished: offset = number of entries
uint8 KIND_FILE_INFO = 2 # OP_OPEN reply: offset = file size
uint8 KIND_CHUNK = 3     # OP_READ reply: offset = byte offset in file, length = payload bytes in data
uint8 KIND_EOF = 4       # OP_READ finished: offset = file size; length = 1 if file_crc32 holds the CRC32 (zlib) of the whole file, which is the case once every byte has been read in order from block 0 in this session
uint8 KIND_ERROR = 5     # offset = error code (ERR_*)

uint8 ERR_ARMED = 1          # transfers are only served while disarmed
uint8 ERR_NOT_FOUND = 2      # file_index out of range or file vanished
uint8 ERR_IO = 3             # open/read/seek failed
uint8 ERR_NO_FILE_OPEN = 4   # OP_READ without a preceding OP_OPEN
uint8 ERR_BUSY = 5           # another session holds the file open

uint16 BLOCK_SIZE = 472      # payload bytes per block

uint8 kind
uint8 session           # token from the request
uint16 file_index
uint16 length           # valid bytes in data
uint32 offset           # see KIND_*
uint32 file_crc32       # see KIND_EOF
uint8[472] data

uint8 ORB_QUEUE_LENGTH = 16
