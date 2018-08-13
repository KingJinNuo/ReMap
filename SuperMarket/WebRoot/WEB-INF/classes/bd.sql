//用户表
create table sm_user(
sm_id varchar2(50) primary key,
sm_phone varchar2(14),
sm_email varchar2(30),
sm_password  varchar2(30),
sm_nickname varchar2(50),
sm_relname varchar2(30),
sm_sex varchar2(6),
sm_birthday varchar2(20)

);
drop table sm_user;
insert into sm_user values('1','*','*','*','*','*','*','*')
commit
select * from sm_user where sm_id='123@123' and sm_password='123'
//产品分类表
create table f_fen(
f_id number primary key,
f_name varchar2(30)
);
select * from f_fen
insert into f_fen values(1,'点心/蛋糕');
insert into f_fen values(2,'饼干/膨化');
insert into f_fen values(3,'熟食/凉菜');
insert into f_fen values(4,'新鲜水果');
insert into f_fen values(5,'见过/炒货');
insert into f_fen values(6,'糖果/蜜饯');
insert into f_fen values(7,'巧克力');
insert into f_fen values(8,'品牌/礼品');
insert into f_fen values(9,'美妆/护肤');
commit
//商品表
create table gds_list(
gds_id varchar2(20) primary key,
gds_name varchar2(50),
gds_discription varchar2(150),
gds_price number(9,2),
gds_date varchar2(50),
gds_qgp varchar2(15),
gds_type varchar2(50),
gds_place varchar2(50),
gds_size varchar2(10),
gds_remain number(10),
gds_fid number references f_fen(f_id)
);
select * from gds_list;
drop table gds_list
update gds_list set gds_remain=998 where gds_id='1'
insert into  gds_list values('1','糖心桂花糕','新鲜烘培 香甜诱人',10.0,'当天','24小时','烘培类','本地','50g/块',999,1);
insert into  gds_list values('2','芝麻糯米糕','精心料理 用心创造',10.0,'当天','24小时','烘培类','本地','50g/块',999,1);
insert into  gds_list values('3','韩式拌面','酸辣过瘾',5.0,'2018-01-01','180天','包装食品','韩国','250g',999,2);
insert into  gds_list values('4','今麦郎方块酥','经典回味',15.0,'2018-01-01','2019-01-01','包装食品','河南郑州','500g',999,2);
insert into  gds_list values('5','闲趣饼干','半晌消闲 闲趣饼干',8.0,'2018-01-01','6个月','膨化食品','河南郑州','400g',999,2);
insert into  gds_list values('6','扇贝粉丝','海鲜海味还想吃',10.0,'现做','现吃','熟食','本地','大扇贝',999,3);
insert into  gds_list values('7','大虾套餐','经济实惠 吃到美味',15.0,'现做','现吃','熟食','本地','大套餐',999,3);
insert into  gds_list values('8','红烧鸡腿','馋到流口水',20.0,'当天','24小时','熟食','本地','大盘装',999,3);
insert into  gds_list values('9','海苔','饭后回味 吃着更美',15.0,'当天','3天','熟食','本地','中等',999,3);
insert into  gds_list values('10','鳕鱼肠','人间美味',10.0,'2018-01-01','3个月','熟食','山东青岛','10g/根',999,3);
insert into  gds_list values('11','大樱桃','新鲜上市',16.0,'当季','常温储藏','水果','本地','2斤/盒',999,4);
insert into  gds_list values('12','桂圆','福建大桂圆 龙眼',30.0,'--','--','水果','福建','5斤/盒',999,4);
insert into  gds_list values('13','苹果','运城水晶果',50.0,'--','--','水果','山西运城','10斤/盒',999,4);
insert into  gds_list values('14','橙子','橙心橙意',50.0,'--','--','水果','广西','10近/盒',999,4);
insert into  gds_list values('15','榴莲','表丑心美 挑战你的味蕾',66.0,'--','--','水果','泰国','3斤/个',999,4);
insert into  gds_list values('16','松子','良品铺子 手剥松子 坚果炒货 巴西松子',56.90,'2018-02-01','180天','坚果','巴西','218g/袋',999,5);
insert into  gds_list values('17','坚果','三只松鼠',25.0,'2018-02-01','180天','坚果','巴西','200g/袋',999,5);
insert into  gds_list values('18','坚果','三只松鼠',25.0,'2018-02-01','180天','坚果','巴西','200g/袋',999,5);
insert into  gds_list values('19','坚果','三只松鼠',25.0,'2018-02-01','180天','坚果','巴西','200g/袋',999,5);
insert into  gds_list values('20','坚果','三只松鼠',25.0,'2018-02-01','180天','坚果','巴西','200g/袋',999,5);
insert into  gds_list values('21','蓝莓','名人岛 青岛现摘新鲜蓝莓 大果 蓝梅 蓝莓鲜果',89.0,'--','--','干果','山东青岛','500/袋',999,6);
insert into  gds_list values('22','彩虹糖','碰到彩虹 遇见彩虹',16.0,'2018-02-03','180天','糖果','本地','500g/袋',999,6);
insert into  gds_list values('23','彩虹软糖','碰到彩虹 遇见彩虹',16.0,'2018-02-03','180天','糖果','本地','500g/袋',999,6);
insert into  gds_list values('24','彩虹软糖','碰到彩虹 遇见彩虹',16.0,'2018-02-03','180天','糖果','本地','500g/袋',999,6);
insert into  gds_list values('25','德芙巧克力','如此丝滑',60.0,'2018-03-01','180天','巧克力','河南郑州','500/盒',999,7);
insert into  gds_list values('26','德芙巧克力','如此丝滑',60.0,'2018-03-01','180天','巧克力','河南郑州','500/盒',999,7);
insert into  gds_list values('27','德芙巧克力','如此丝滑',60.0,'2018-03-01','180天','巧克力','河南郑州','500/盒',999,7);
insert into  gds_list values('28','MyMiss指环','Miss送给想念的人',666.0,'--','--','饰品/礼品','--','--',999,8);
insert into  gds_list values('29','MyDear项链','Dear送给喜欢的人',999.0,'--','--','饰品/礼品','--','--',999,8);
insert into  gds_list values('30','MyLove项链','Love送给祝福的人',1314.0,'--','--','饰品/礼品','--','--',999,8);
insert into  gds_list values('31','深层净化洗面奶','深层修复 告别油腻',69.0,'2018-01-02','3年','护肤品','深圳','250ml/瓶',999,9);
insert into  gds_list values('32','千纤草','千纤草 丝瓜水500ml*2 两支装',49.0,'2018-01-02','3年','护肤品','深圳','500ml/瓶',999,9);
insert into  gds_list values('33','玉兰油','玉兰油Olay面霜多效修护50g',119.0,'2018-01-02','3年','护肤品','香港','50g/瓶',999,9);
insert into  gds_list values('34','姬芮','姬芮(Za)甄选隔离2件套(新能真皙美白隔离霜35gx2)(隔离紫外线 提亮肤色 防晒SPF26)',119.0,'2018-01-02','3年','护肤品','香港','50g/瓶',999,9);
insert into  gds_list values('35','卡姿兰','卡姿兰（Carslan）大眼睛持久液体眼线笔2ml (防水不晕染眼线笔 眼线液笔 彩妆）',59.0,'2018-01-02','3年','护肤品','香港','--',999,9);
insert into  gds_list values('36','美宝莲','美宝莲（MAYBELLINE）广角旋转刷头睫毛膏 弯弯睫毛膏11ML（旋转头 睫毛膏 眼妆 不晕染 浓密大眼）',118.0,'2018-01-02','3年','护肤品','香港','11ml/瓶',999,9);
insert into  gds_list values('37','丝蕴(Syoss)无硅水润','丝蕴(Syoss)无硅水润电商套装(洗发水750ml*2+润发乳750ml)(新老包装随机发货)',79.0,'2018-01-02','3年','护肤品','香港','--',999,9);
insert into  gds_list values('38','牛奶身体乳','所望SOMANG牛奶身体乳500ml',69.0,'2018-01-02','3年','护肤品','香港','500ml/瓶',999,9);
insert into  gds_list values('39','多芬(DOVE)','多芬(DOVE)洗发水护发素套装 密集滋养修护(洗发乳700ml+润发精华素195mlx2)',60.0,'2018-01-02','3年','护肤品','香港','--',999,9);
insert into  gds_list values('40','美康粉黛','美康粉黛 醉美东方口红不掉色防水不沾杯保湿滋润唇膏',56.0,'2018-01-02','3年','护肤品','香港','--',999,9);

//订单表
create table order_ding(
order_id varchar2(20) primary key,
order_status varchar2(20),
order_date varchar2(60),
order_toatls number(9,2),
order_userid varchar2(50) references sm_user(sm_id),
order_addid number references sm_address(address_id)
);
delete from order_ding where order_id!='1658573436107008'
drop table order_ding;
drop table order_goods
select * from order_ding where order_userid='111@111'
//订单-商品表
create table order_goods(
orderid varchar2(30) references order_ding(order_id),
goodsid varchar2(20) references gds_list(gds_id),
goodscount number
);
delete * from order_goods 
select gds_id,
gds_name,
gds_discription, 
gds_price,
gds_date,
gds_qgp,
gds_type, 
gds_place,
gds_size,
gds_remain, 
goodscount
 from gds_list g,order_goods d where g.gds_id=d.goodsid and orderid='0388686642278225'
select * from order_ding;
select * from order_ding d,order_goods g where d.order_id=g.orderid and order_userid='111@111' 
select * from order_goods;
//地址表
create table sm_address(
address_id number primary key,
address_recive varchar2(30),
address_tel varchar2(15),
address_add varchar2(50),
user_id varchar2(50) references sm_user(sm_id)
);

drop table sm_address
drop table order_goods
drop table order_ding

insert into sm_address values(69,'皮皮','13951649976','3号楼421室','123@123');
insert into sm_address values(2,'皮皮','13951649976','5号楼201室', to_char '123@123');
commit
select * from sm_address where user_id='123@123'

insert into sm_address values(select count(*) from sm_address where user_id='123@123','皮皮','13951649976','3号楼421室','123@123');