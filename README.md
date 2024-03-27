This script captures frames from a video file at specified intervals. It prompts the user to input the interval in seconds and the path to the video file. Then, it extracts the duration of the video and iterates through the video, capturing frames at the specified interval. The captured frames are saved as individual image files. If any required parameter is missing or if the file doesn't exist, appropriate error messages are displayed. Finally, it notifies the user when the process of capturing frames is completed.

Usage:
```
./screencaps.bash <video_file_path> <interval_in_seconds>
```
But first:
```
chmod +x screencaps.bash
```
