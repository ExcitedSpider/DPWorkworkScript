# 使用说明



1. 把所有脚本放在和视频一个目录下

2. 创建csv文件，示例是demo.csv

3. powershell执行命令，示例：

   ```powershell
   .\makehomework.ps1 -csv .\demo.csv -video 29.mp4 -beginid 0
   ```

## 参数说明

-csv: csv文件

-video:准备切的视频

-beginid:编号的开始id

## JSON

生成的JSON只包括sentences数组，脚本执行完毕会复制到你的剪贴板（而不是生成文件，因为没有前面的）