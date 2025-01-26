# docker-ffmpeg-rtsp-to-sequence
 Docker FFMPEG in Alpine Linux to Record RTSP to Sequence of MP4 Files

## Environmental Variables
 - INPUT_STREAM - RTSP URL for originating stream
 - OUTPUT_PREFIX - Text to add before timestamp on output files - MUST NOT INCLUDE "." or "_" (default "Stream")
 - SEGMENT_TIME - Clock time in seconds to split the files based on 24 hour clock starting at midnight (default 300 - 5 minutes)
 - SEGMENT_FORMAT - FFMPEG format to make the output files (default MP4)
 - SEGMENT_EXTENSION - File extension (default mp4)
 - NO_AUDIO - Set to 1 to Disable audio recording (default 0 - Record Audio)
 - DELETE_CORRUPT - Set to 1 to delete corrupt tmp files (default 0 - Save Corrupt Files - This may create a lot of corrupt files if there are problems)
 - TZ - Local timezone to use for timestamps and folder structure (default UTC)
 
## Output Volume
 - /output - Output files will be generated in the volume mounted to this folder
  - /output/[YEAR]/[MONTH]/[DAY]/[HOUR]/[OUTPUT_PREFIX]_[YEAR]-[MONTH]-[DAY]_[HOUR]-[MINUTE]-[SECOND]_[TIMEZONE].[SEGMENT_EXTENSION]
  - /output/tmp - Temporary folder for in progress recordings
 
## Automatic Cleanup
 - Files are recorded in TS format and then are converted to MP4 when moved to final directory
 - If the final file is not playable, the temporary TS file will not be deleted unless DELETE_CORRUPT is set to 1
 - Temporary files which are interrupted during recorded will attempt to be transferred on next launch but may not be recoverable
 