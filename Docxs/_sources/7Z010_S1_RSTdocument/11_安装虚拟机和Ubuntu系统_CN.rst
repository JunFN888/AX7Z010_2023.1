安装虚拟机和Ubuntu系统
===================================

后面的教程要涉及到嵌入式Linux开发，一般需要一台Linux操作系统主机，用来编译u-boot或者Linux-kernel。在Windows操作系统的电脑上安装个虚拟机，再在虚拟机上安装Linux操作系统是最便捷的方法了。

虚拟机软件安装
--------------

我们提供的虚拟机的安装软件版本为VMware-worksation-full
12.1.1。用户可以在我们提供的资料里找到, 双击
“VMware-workstation-full-12.1.1-3770994.exe”
图标开始安装。因为安装比较简单，所以具体的安装步骤我们这里不做具体介绍了，用户只要按照默认安装项一直点"Next"按键来进行安装。安装完成的最后一个界面里，我们需要选择许可证来输入一个VMware12的序列号。

.. image:: images/11_media/image1.png
   :width: 4.30417in
   :height: 3.31319in

.. image:: images/11_media/image2.png
   :width: 4.90417in
   :height: 3.79097in

安装完成后，桌面上有VMware Workstation Pro的图标。

.. image:: images/11_media/image3.png
   :width: 1.22639in
   :height: 1.16528in

Ubuntu安装
----------

安装系统
~~~~~~~~

安装好虚拟机后，就要在虚拟机上安装Linux 操作系统了。鉴于ubuntu
Linux桌面操作系统的安装以及配置较为简单，所以我们选择了ubuntu桌面操作系统。

本教程使用Ubuntu 16.04.3 LTS 64位操作系统

如果使用其他版本，可能有不可预料的错误，请保持版本一致，请不要升级系统。

ubuntu安装步骤如下：

1) 双击桌面的VMware Workstation Pro的图标，然后在VMware工作界面上点击“创建新的虚拟机”图标。

.. image:: images/11_media/image4.png
   :width: 5.52153in
   :height: 2.93889in

2) 选择典型，下一步。

.. image:: images/11_media/image5.png
   :width: 3.41736in
   :height: 3.30417in

3) 选择"安装程序光盘映像文件(iso)"项，然后点击浏览找到ubunt的光盘映像文件“ubuntu-16.04.3-desktop-amd64.iso”。

.. image:: images/11_media/image6.png
   :width: 4.0993in
   :height: 3.99282in

4) 在虚拟机向导里输入虚拟机的全名，用户和密码。这里的全名，用户名和密码用户可以自行设置。

.. image:: images/11_media/image7.png
   :width: 4.51531in
   :height: 4.39803in

5) 虚拟机名称可以自己修改，安装位置需要选择安装到硬盘空间比较充足的磁盘\ |image1|

6) 设置最大的磁盘大小为300G，我们需要在虚拟机里安装软件，这里预留空间大一些。用户可以根据自己的硬盘空间选择合适的空间尺寸，建议大于等于300G。

.. image:: images/11_media/image9.png
   :width: 4.69132in
   :height: 4.56947in

7) 选择自定义硬件

.. image:: images/11_media/image10.png
   :width: 4.64934in
   :height: 4.52858in

8) 可以根据修改修改内存大小和处理器核心，网络适配器选项，网络连接选择桥接模式

.. image:: images/11_media/image11.png
   :width: 4.49016in
   :height: 3.70657in

9) 点击完成就开始安装Ubuntu了

.. image:: images/11_media/image12.png
   :width: 4.11001in
   :height: 4.00326in

10) 安装过程比较慢，要等待一段时间

.. image:: images/11_media/image13.png
   :width: 5.35606in
   :height: 3.65433in

11) 安装完成以后进入系统

.. image:: images/11_media/image14.png
   :width: 6.00417in
   :height: 5.05954in

修改软件源服务器
~~~~~~~~~~~~~~~~

1) 为了以后安装软件方便，我们要设置一下软件源，点击系统设置

.. image:: images/11_media/image15.png
   :width: 6.00417in
   :height: 4.48164in

2) 在“Software & Updates”中选择“Other...”

.. image:: images/11_media/image16.png
   :width: 6.00417in
   :height: 3.60639in

3) 点击“Select Best Server”，可以测试出一个最快的服务器，然后选择“Choose Server”，这些操作都是基于虚拟机能够连接互联网的情形。

.. image:: images/11_media/image17.png
   :width: 6.00417in
   :height: 3.84446in

4) 输入密码，完成软件源修改

.. image:: images/11_media/image18.png
   :width: 6.00417in
   :height: 3.8795in

设置bash为默认sh
~~~~~~~~~~~~~~~~

1) Ctrl+Alt+T打开终端

..

   .. image:: images/11_media/image19.png
      :width: 4.99875in
      :height: 3.06995in

2) 输入命令，Configuring dash选择“No”，回车确认

+-----------------------------------------------------------------------+
| sudo dpkg-reconfigure dash                                            |
+=======================================================================+
+-----------------------------------------------------------------------+

..

   .. image:: images/11_media/image20.png
      :width: 5.42166in
      :height: 3.22463in

设置屏幕锁定时间
~~~~~~~~~~~~~~~~

为了能复制大文件到Ubuntu系统，我们取消屏幕锁定

.. image:: images/11_media/image21.png
   :width: 6.00417in
   :height: 2.68218in

常见问题
--------

虚拟机要求虚拟化支持
~~~~~~~~~~~~~~~~~~~~

1) 如果安装Ubuntu弹出以下的错误信息框的话，用户需要重启电脑，进入BIOS里进行设置。

.. image:: images/11_media/image22.png
   :width: 3.57361in
   :height: 2.64375in

重启电脑后，进入到BIOS里，找到Intel虚拟化技术这一项，点击开启。不同的主板，可能名字不太一样。

.. image:: images/11_media/image23.jpeg
   :width: 4.92153in
   :height: 2.43472in

.. |image1| image:: images/11_media/image8.png
   :width: 5.24028in
   :height: 5.10417in


*ZYNQ-7000开发平台 FPGA教程*    - `Alinx官方网站 <http://www.alinx.com>`_