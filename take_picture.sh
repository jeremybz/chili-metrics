#!/bin/bash                                                                                                                  

# take a pic this size using a webcam
PIC_SIZE='1280x720'

# wait 50 frames to adapt to light levels
FRAME_SKIP=50

DIR=/home/pi/pics
LASTPIC="${DIR}/lastpic.jpg"

ip=`hostname -I | sed -e 's/\./_/g' | sed -e 's/ //g'`

FNAME="cam_${ip}_`date +%Y%m%d_%H%M%S`.jpg"
F="${DIR}/${FNAME}"

fswebcam -S ${FRAME_SKIP} -r ${PIC_SIZE} ${F}

# Update link to the most recent pic
rm ${LASTPIC}
ln -s ${F} ${LASTPIC}
