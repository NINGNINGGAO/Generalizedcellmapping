#Generalizedcellmapping
===

## 原理
**>基本思想是将动力系统状态空间离散化为小的几何体，全部胞构成胞空间，动力系统中的状态转移自然对应为胞之间的转移，通过对胞之间的转移关系的研究完成对原动力系统的研究**

## 实现方案
- [x] 本代码采用的西北工业大学理学院方面的图胞映射路线，参考的岳晓乐老师及韩群老师等人的论文This site was built using [Paper](https://github.com/NINGNINGGAO/cellmappingpaper).
- [ ] ~~未三维以上复合胞映射方法，复合胞映射拟采用贺群老师，大家感兴趣的话，可以自己实现一下~~

## 声明
**- 代码完全由个人编写实现**

## 说明
- 代码具体说明文件可以看[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)文件

- 参数都在[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)里面修改，修改方程在自治方程-[V1_tode.m](code/V1_tode.m),非自治方程-[V_tode.m](code/V_tode.m),自治方程GPU-[V1_GPU_tode.m](code/V1_GPU_tode.m),非自治方程GPU-[V2_GPU_tode.m](code/V2_GPU_tode.m)里面修改，里面给出了示例

- 画图采用的[NEWplot.m](code/NEWplot.m)，只实现了二维和三维的画图 ~~更高维的画图没有编写，有需要可以自行编写，画图所需的参数可以参照~~

- 使用时需要修改[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)，[GNN.m](code/GNN.m)模块中的路径，以及[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)中的个人邮箱

- 本代码主要实现定性分析 ~~定量分析只完成了一维的画图，如需修改，在[GRA.m](code/GRA.m)中修改~~

- 使用MATLAB2017b编写

- ~~版本较低可能会有问题~~

- 希望大家能继续完善

## 授权
- Code of this project is licensed under the [MIT license](LICENSE).

**NINGNINGGAO 2019年3月15日**
