# Request to the log_transfer module to list, open, read or cancel a ULog
# download. Sent by the companion over uXRCE-DDS on /fmu/in/log_transfer_request.
# Replies arrive as LogTransferData on /fmu/out/log_transfer_data.

uint64 timestamp        # time since system start (microseconds)

uint8 OP_LIST = 0       # enumerate .ulg files; replies: one KIND_ENTRY per file, then KIND_LIST_END
uint8 OP_OPEN = 1       # open file_index (ordinal from OP_LIST); reply: KIND_FILE_INFO
uint8 OP_READ = 2       # send blocks [block, block + count) of the open file; count = 0 reads through EOF
uint8 OP_CANCEL = 3     # close the open file and release the DDS publication gate
uint8 OP_KEEPALIVE = 4  # refresh the idle timeout during a long read; no reply

uint8 op
uint8 session           # client-chosen token, echoed in every reply
uint16 file_index       # ordinal from OP_LIST (directories and files sorted by name)
uint32 block            # first block, in units of LogTransferData BLOCK_SIZE bytes
uint32 count            # number of blocks to send, 0 = until end of file

uint8 ORB_QUEUE_LENGTH = 4
