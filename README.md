# docker-ffmpeg-rtsp-to-sequence
 Docker FFMPEG in Alpine Linux to Record RTSP to Sequnce of MP4 Files

## Environmental Variables
 - INPUT_STREAM - RTSP URL for originating stream
 - OUTPUT_PREFIX - Text to add before timestamp on output files
 - SEGMENT_TIME - Clock time in seconds to split the files based on 24 hour clock
 - SEGMENT_FORMAT - FFMPEG format to make the output files
 
## Output Volume
 - /output - Output files will be generated in /output/YEAR/MONTH/DAY/HOUR/
 