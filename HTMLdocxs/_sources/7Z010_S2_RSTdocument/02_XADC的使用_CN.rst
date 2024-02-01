XADC的使用
============

本章介绍XADC的使用，XADC内嵌在PS端，允许CPU或其他主机连接XADC，而不用使用PL端。XADC最大采样率为1MSPS，精度为12bits，内置电压和温度传感器，可监测芯片的电压及温度信息。如图所示电压传感器可监测芯片的VCCINT,VCCAUX,VCCBRAM等，VP_0和VN_0为一对专用的ADC模拟输入口。VAUXP[*]和VAUXN[*]也是ADC输入口，但是不用作ADC输入口时，可用作普通IO使用。在AX7015/AX7021/AX7010/AX7020/AX7Z035/AX7Z100开发板上这些引脚均未引出。因此本实验主要测量温度传感器Temperature
Sensor以及电压传感器Supply Sensors的值。

.. image:: images/02_media/image1.png
   :width: 5.03477in
   :height: 3.10501in

本实验介绍三种读取传感器信息值的方法。首先需要新建Vivado工程，同样以“ps_hello”工程为基础，另存一个工程，不再赘述。

Hardware读取XADC
----------------

1. 打开工程，连接好开发板电源，JTAG下载器，并将开发板调整为JTAG模式，开发板上电，点击Open
   Hardware Manager，再点击Auto Connect，发现硬件。

.. image:: images/02_media/image2.png
   :width: 2.69288in
   :height: 1.6982in

2. 右键选中XADC，新建Dashboard

.. image:: images/02_media/image3.png
   :width: 3.41625in
   :height: 2.02548in

3. 修改名称，点击OK

.. image:: images/02_media/image4.png
   :width: 2.12855in
   :height: 3.16808in

4. 默认会有温度信息

.. image:: images/02_media/image5.png
   :width: 5.57138in
   :height: 2.52167in

5. 点击+将电压值添加到窗口

.. image:: images/02_media/image6.png
   :width: 5.16085in
   :height: 2.87667in

6. 显示如下

.. image:: images/02_media/image7.png
   :width: 5.04541in
   :height: 2.24991in

此方法优点是图形化显示，较为直观，但缺点是无法得到数据值。下面介绍PS读取XADC信息。

PS读取XADC信息
--------------

1. 打开Vitis软件，新建Vitis工程，已经为大家准备好了程序，可拷贝到新的工程

.. image:: images/02_media/image8.png
   :width: 1.96736in
   :height: 2.27361in

2. 可以在platform.spr的BSP中看到PS自带有XADC外设

.. image:: images/02_media/image9.png
   :width: 6.00208in
   :height: 3.275in

3. 在本实验中主要用到xadcps.h和xadcps_hw.h

.. image:: images/02_media/image10.png
   :width: 2.60972in
   :height: 2.91806in

4. 此实验现象为读取温度和电压的数据，并每隔1S通过串口打印出来。通过XAdcPs_GetAdcData函数读取原始值，用XAdcPs_RawToTemperature宏将ADC值转换为温度值。用XAdcPs_RawToVoltage转换为电压值。

.. image:: images/02_media/image11.png
   :width: 4.42985in
   :height: 1.90607in

5. Run as下载后在串口工具中可看到打印信息如下：

.. image:: images/02_media/image12.png
   :width: 3.85008in
   :height: 2.4255in

此方法简单方便，可以读取数据信息，但是其信号对于PL端来说是不可见的，灵活性差些。参考资料UG585，UG480。下面再介绍AXI总线方式读取数据。

AXI总线读取XADC信息
-------------------

前面PS端读取XADC实验是通过查询的方式读取，本小节实验我们想在查询的基础上，添加中断，监测温度是否超过一定温度，如果超过了，就产生中断。

1. 添加XADC模块，点击Run Connection Automation

.. image:: images/02_media/image13.png
   :width: 4.41491in
   :height: 1.89895in

2. 重新配置Zynq CPU，添加PL端中断，点击OK完成

.. image:: images/02_media/image14.png
   :width: 3.96294in
   :height: 3.06927in

3. 连接XADC中断到CPU中断口， |image1|

4. 由于板子连接了Vp_Vn，以及VAUX1, VAUX9,
   VAXU12四个XADC的外部引脚，因此需要对XADC模块进行配置，在Basic界面设置为Channel
   Sequencer

.. image:: images/02_media/image16.png
   :width: 4.4253in
   :height: 3.56184in

.. image:: images/02_media/image17.png
   :width: 5.65685in
   :height: 4.00284in

在Channel Sequencer界面，选择上四路通道，点击OK

.. image:: images/02_media/image18.png
   :width: 5.68294in
   :height: 3.91154in

5. 将四个通道导出引脚，并修改名称

.. image:: images/02_media/image19.png
   :width: 6.00417in
   :height: 2.95833in

6. 重新Generate Output Products，之后open Elaborated Design，并在IO
   Ports里修改引脚位置，这些位置是固定的，主要是电平标准的设置，保存到xdc文件内。Vp_Vn读取的是板子的电流，VAUX12为板子的供电电压5V，VAUX1和VAUX9连接的是SMA接头。

.. image:: images/02_media/image20.png
   :width: 6.00417in
   :height: 3.23958in

7. 此次需要生成Bitstream，点击Generate Bitstream，生成FPGA下载文件。

.. image:: images/02_media/image21.png
   :width: 2.09129in
   :height: 1.53374in

8. 重新Export Hardware，在这里在选中Include bitstream

.. image:: images/02_media/image22.png
   :width: 3.97847in
   :height: 1.56458in

9. XADC有很多报警信号alarm，如温度，电压等，此实验通过设置XADC的温度的Temp
   Upper和Temp Lower值，设置中断，一旦温度超过Temp
   Upper的值，就会触发中断

.. image:: images/02_media/image23.png
   :width: 4.27706in
   :height: 2.66797in

温度值与ADC Code值换算关系式如下，程序中有现成的公式可用

.. image:: images/02_media/image24.png
   :width: 4.08991in
   :height: 0.35881in

10. 新建Vitis工程

.. image:: images/02_media/image25.png
   :width: 2.49792in
   :height: 1.30208in

11. 在platform.spr的BSP里多了一个模块，也就是刚才添加的XADC模块，用到了sysmon.h和sysmon_hw.h头文件。

.. image:: images/02_media/image26.png
   :width: 4.72639in
   :height: 2.82222in

12. 以下为设置温度的upper和lower值，打开全局中断和温度中断，中断寄存器可以在PG091文档中找到

.. image:: images/02_media/image27.png
   :width: 3.11654in
   :height: 2.24905in

温度中断使能为ALM[0]，打开此中断即可

.. image:: images/02_media/image28.png
   :width: 3.78463in
   :height: 1.87757in

XSysMon_IntrGlobalEnable(); 全局中断使能函数

XSysMon_IntrEnable(); 中断使能函数，可使用MASK宏定义来确定需要打开的中断

13. 中断服务程序中使用XsysMon_IntrGet_Status();函数读取中断状态寄存器，确定是否是温度中断，打印信息，最后使用XSysMon_IntrClear();函数清除中断

.. image:: images/02_media/image29.png
   :width: 3.12671in
   :height: 1.50601in

14. 打开Run Configuration窗口，新建System Debugger，选择Program
    FPGA，点击Run

.. image:: images/02_media/image30.png
   :width: 5.99514in
   :height: 4.00069in

15. 在程序中设置了电流的转换，电流为0.48A左右，电压VAUX12为5V左右，有一定偏差。SMA没有连接信号。

.. image:: images/02_media/image31.png
   :width: 4.56462in
   :height: 2.87414in

XADC的ADC接口电压范围是0-1V，我们的电路设计做了分压，分压值为10，因此从SMA接入的电压输入范围为0-10V。

16. 程序中设置Upper为80摄氏度，在高于80度后会触发一次中断，等温度降到lower温度后，如果温度再次上升到Upper温度之上，又会触发中断。如下串口所示。

.. image:: images/02_media/image32.png
   :width: 4.15854in
   :height: 2.61983in

当然还有其他许多报警，可以通过配置Alarm
Threshold寄存器和中断寄存器实现不同的监测功能。

.. image:: images/02_media/image33.png
   :width: 4.29624in
   :height: 3.90003in

此种方法不但可以访问温度和电压传感器，还可以在PL端进行访问，本章不再做讲解。

本章小结
--------

本章介绍了三种读取XADC的方法，各有优缺点，用户可根据需求选择需要的方式。

.. |image1| image:: images/02_media/image15.png
   :width: 4.78882in
   :height: 2.23121in
