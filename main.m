fluid1='methane';
fluid2='ethane';
fluid3='nitrogen';
%这里为了方便将所有物质替换成fluid1,fluid2,fluid3的字符串
x0=[0.94 0.04 0.02];
p0=refpropm('P','T',150,'Q',0,fluid1,fluid2,fluid3,x0);
%第一个元素P代表函数的返回量为压力值
%第二个元素T代表温度值为150K，是输入量
%第三个元素Q代表干度为0，是输入量
%该函数就是求对应温度为150K，组分为x0的混合物的对应的饱和液体温度
[x0,y0]=refpropm('X','T',150,'Q',0,fluid1,fluid2,fluid3,x0)
%第一个元素X代表函数的返回量为组分，这中求解方法是热物性中精度的Flash算法
%该算法的作用就是求混合物流体为气液两项态时候的对应的气态混合物组分和液态
%混合物组分 这里的x0代表液态的组分，y0代表气态的组分
DV0=refpropm('D','T',150,'Q',1,fluid1,fluid2,fluid3,y0);
%第一个元素D代表函数的返回量为密度值
%第二个元素T代表温度值为150K，是输入量
%第三个元素Q代表干度为1，是输入量
%该函数就是求对应温度为150K，组分为y0的混合物的对应的饱和气态温度
DL0=refpropm('D','T',150,'Q',0,fluid1,fluid2,fluid3,x0);
%这个可自行解释，略
fluid1='methane';
fluid2='ethane';
fluid3='nitrogen';
x=[0.9394    0.0398    0.0208]
P1=515.6982
hl1=7.3300e+04;
[Q,TL1,DL1,Dv0]=refpropm('QT+-','P',P1,'H',hl1,fluid1,fluid2,fluid3,x);
%第一个元素是 QT+- 和上面的单输出案例有些不同
%实际上 就是指，此时函数需要返回 干度 温度 液态密度 气态密度 
%而第二个元素P，就代表使用压力作为输入量，值为P1
%第三个元素为H，代表使用焓为输入量’，值设定为hl1
%fluid1 fluid2 fluid3代表混合物的三种物质
% 就是这三种物质组分的量
[kv,Dv,beta,Viscv,Cpv,hv] = refpropm('LDBVCH','T',TL1,'P',600,fluid1,fluid2,fluid3,x)
%这个案例，读者自行理解解释
