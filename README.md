# Generalizedcellmapping
===

## theory
**>基本思想是将动力系统状态空间离散化为小的几何体，全部胞构成胞空间，动力系统中的状态转移自然对应为胞之间的转移，通过对胞之间的转移关系的研究完成对原动力系统的研究**

## Scheme selection
- [x] 本代码采用的西北工业大学理学院方面的图胞映射路线，参考的岳晓乐老师及韩群老师等人的论文
- [ ] ~~未三维以上复合胞映射方法，复合胞映射拟采用贺群老师的[Paper](http://xueshu.baidu.com/usercenter/paper/show?paperid=857f134b01b83c8052b3971f4171c583&site=xueshu_se).，大家感兴趣的话，可以自己实现一下~~

## statement
**- Code is written entirely by individuals**
**- All rights reserved**
**- All materials not authorized may not be redirected or for other usages！**

## Operation instructions
- 代码具体说明文件可以看[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)文件

- 参数都在[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)里面修改，修改方程在自治方程-[V1_tode.m](code/V1_tode.m),非自治方程-[V_tode.m](code/V_tode.m),自治方程GPU-[V1_GPU_tode.m](code/V1_GPU_tode.m),非自治方程GPU-[V2_GPU_tode.m](code/V2_GPU_tode.m)里面修改，里面给出了示例

- 画图采用的[NEWplot.m](code/NEWplot.m)，只实现了二维和三维的画图 ~~更高维的画图没有编写，有需要可以自行编写，画图所需的参数可以参照~~

- 使用时需要修改[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)，[GNN.m](code/GNN.m)模块中的路径，以及[MULT_CELLMAPPING.m](code/MULT_CELLMAPPING.m)中的个人邮箱

- 本代码主要实现定性分析 ~~定量分析只完成了一维的画图，如需修改，在[GRA.m](code/GRA.m)中修改，参考胞映射方面的论文~~

- 使用MATLAB2017b编写

- ~~版本较低可能会有问题~~

## More
- 寻求有愿意继续完善的朋友

- 所有提交内容的贡献者，将会在文中体现贡献者个人信息

- 联系方式：**707288044@qq.com**

## NOTICE
- Act smart
- Read LICENSE(LICENSE) and README(README.md)
- When you come across a problem, try these steps first
  - [Google Search](https://www.google.com/)
  - [baidu Search](https://www.baidu.com/)
  - [CSDN](https://www.csdn.net/)
  - [Matlab Comunity](https://www.mathworks.com/matlabcentral/?s_tid=gn_mlc)
  - [博客园](https://www.cnblogs.com/)
- Before you ask
  - Read [How To Ask Questions The Smart Way](http://www.catb.org/~esr/faqs/smart-questions.html)
  - Chinese version[提问的智慧](https://github.com/tvvocold/How-To-Ask-Questions-The-Smart-Way)
- When you ask
  - Be nice
  - Chinese Language is preferred
  - Attach useful information, describe what you have tried

## License
- Code of this project is licensed under the [MIT license](LICENSE).

**NINGNINGGAO    2019.3.15**
