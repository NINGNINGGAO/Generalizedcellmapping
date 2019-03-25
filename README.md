#Generalizedcellmapping
===

## 原理
**基本思想是将动力系统状态空间离散化为小的几何体，全部胞构成胞空间，动力系统中的状态转移自然对应为胞之间的转移，通过对胞之间的转移关系的研究完成对原动力系统的研究**

## 实现方案
- [ ] 本代码采用的西北工业大学理学院方面的图胞映射路线，参考的岳晓乐老师及韩群老师等人的论文
- [x] 未三维以上复合胞映射方法，复合胞映射拟采用贺群老师，大家感兴趣的话，可以自己实现一下

## 声明
**- 代码完全由个人编写**

## 说明
- 代码具体说明文件可以看[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)文件

- 参数都在[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)里面修改，修改方程在自治方程-[V1_tode.m](code/V1_tode.m),非自治方程-[V_tode.m](code/V_tode.m),自治方程GPU-[V1_GPU_tode.m](code/V1_GPU_tode.m),非自治方程GPU-[V2_GPU_tode.m](code/V2_GPU_tode.m)里面修改，里面给出了示例

- 画图采用的[NEWplot.m](code/NEWplot.m)，大家如果有不同的画图需求，可以在里面修改

- 代码完成度还不是很高，还有细分方法及绘图没有完全完成，如果有时间会更新

- 使用MATLAB2017b编写，版本较低可能会有问题

希望大家能继续完善

NINGNINGGAO 2019年3月15日
