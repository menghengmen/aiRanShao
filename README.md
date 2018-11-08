# aiRanShao
高仿马蹄运动项目
##### 偶然间发现自如app房源详情页的轮播图挺有意思的：
![gif图](https://github.com/menghengmen/aiRanShao/blob/master/gif5%E6%96%B0%E6%96%87%E4%BB%B6-2.gif)  

XYFlatBrawerHeader的协议方法
```objc
@protocol FlatDrawerDelegate<NSObject>;
@optional
-(NSInteger)numOfSectionsInDrawer:(XYFlatBrawerHeader *)flatBrawerHeader;///有几块
-(NSInteger)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader numOfIntemsInSection:(NSInteger)sectionIndex;///某一块有几张图片
-(NSArray *)titlesOfFlatBrawer:(XYFlatBrawerHeader *)flatBrawerHeader;///快的名字
@required
-(UIImageView *)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader itemForHeaderAtIndex:(NSInteger)index;
@end
```
欢迎fork,star
