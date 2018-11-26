import cv2
import numpy as np
import sys

if len(sys.argv) != 2:
    print('no video input, script return')
    sys.exit(1)

print('outfile/temp4_'+sys.argv[1]+'.avi')
videoCapture1 = cv2.VideoCapture('outfile/temp4_'+sys.argv[1]+'.avi')
# 从文件读取视频
# 判断视频是否打开
if (videoCapture1.isOpened()):
    print('Open')
else:
    print('Fail to open!')

fps = videoCapture1.get(cv2.CAP_PROP_FPS)  # 获取原视频的帧率

size1 = (int(114), int(144))
size2 = (int(577),int(450))# 自定义需要截取的画面的大小
#size = (int(videoCapture.get(cv2.cv.CV_CAP_PROP_FRAME_WIDTH)),int(videoCapture.get(cv2.cv.CV_CAP_PROP_FRAME_HEIGHT)))#获取原视频帧的大小
videoWriter1 = cv2.VideoWriter('outfile/hand4_'+sys.argv[1]+'.avi', cv2.VideoWriter_fourcc(*'MJPG'), fps, size1)
videoWriter2 = cv2.VideoWriter('outfile/video4_'+sys.argv[1]+'.avi', cv2.VideoWriter_fourcc(*'MJPG'), fps, size2)

success1, frame = videoCapture1.read()
 # 读取第一帧

while success1 :
    frame1= frame[374:518, 29:143]
    frame2 = frame[:450,143:]# 截取画面
    videoWriter1.write(frame1)
    videoWriter2.write(frame2)# 将截取到的画面写入“新视频”
    success1, frame = videoCapture1.read() # 循环读取下一帧
videoCapture1.release()