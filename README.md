# docker-ffmpeg-rtsp-to-sequence
 Docker FFMPEG in Alpine Linux to Record RTSP to Sequnce of MP4 Files

## Environmental Variables
 - INPUT_STREAM - RTSP URL for originating stream
 - OUTPUT_PREFIX - Text to add before timestamp on output files (MUST NOT INCLUDE "." or "_")
 - SEGMENT_TIME - Clock time in seconds to split the files based on 24 hour clock
 - SEGMENT_FORMAT - FFMPEG format to make the output files (default MP4)
 
## Output Volume
 - /output - Output files will be generated in /output/YEAR/MONTH/DAY/HOUR/
 
## Automatic Cleanup
 - Files are recorded in TS format and then are converted to MP4 when moved to final directory
 - If the final file is not playable, the temporary TS file will not be deleted
 - Temporary files which are interrupted during recorded will attempt to be transferred on next launch
 