//
//  RecommendModel.h
//  麻花影视
//
//  Created by 哈哈 on 2018/9/15.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <Foundation/Foundation.h>
//"advertiseType": "",
//"anonymous": 0,
//"appId": "1",
//"avatar": "/res/common/images/huonv.png",
//"blackFlag": 0,
//"categoryName": "",
//"commentTimes": 12,
//"createTime": "2018-09-14 22:25:31",
//"createTimeStr": "9小时前",
//"description": "四",
//"downLoadTimes": 0,
//"favorTimes": 3,
//"goodNum": 8,
//"groupId": 62,
//"groupLogo": "/126/45974811714b3440ab4db40fafc88b11.jpg",
//"groupName": "成人动漫",
//"hotFlag": 0,
//"id": 105012,
//"ifAllFlag": 1,
//"imageUrl": "/102/69e581d0327a8855e89fa47e4148a789.jpg;/14/82c4d9e530b4b3ad5687973b4f405976.jpg;/7/03ed73e5c076d96f3e26d4d8b14d7a44.jpg;/125/920c7ed83f420fc7ea0ddafdb591e903.jpg;/18/856fc7d317ebf54e8b073e40a28c3d1b.jpg;/125/24cecb8ad781bdba6f6017003c1507b7.jpg;/71/9d2f8fea465c8ac4c7da50c3905e18df.jpg",
//"isAttention": 0,
//"isFavor": 0,
//"isThumbUp": 0,
//"isView": 0,
//"level": 1,
//"linkAddress": "",
//"memberId": 399594,
//"msgType": 0,
//"name": "火女_ibl8vnney0",
//"picNum": 7,
//"postType": 1,
//"recommendFlag": 0,
//"robotRecommendNum": 0,
//"sex": "2",
//"shareTimes": 1,
//"shortVideoFlag": 0,
//"silenceFlag": 0,
//"size": "828*1169;828*1174;828*1174;828*1173;828*1178;828*1186;828*1164",
//"source": 0,
//"status": 1,
//"thumbnail": "/102/thumb_69e581d0327a8855e89fa47e4148a789.jpg;/14/thumb_82c4d9e530b4b3ad5687973b4f405976.jpg;/7/thumb_03ed73e5c076d96f3e26d4d8b14d7a44.jpg;/125/thumb_920c7ed83f420fc7ea0ddafdb591e903.jpg;/18/thumb_856fc7d317ebf54e8b073e40a28c3d1b.jpg;/125/thumb_24cecb8ad781bdba6f6017003c1507b7.jpg;/71/thumb_9d2f8fea465c8ac4c7da50c3905e18df.jpg",
//"tipFlag": 0,
//"title": "",
//"totalGoodNums": 8,
//"videoCommentTimes": 12,
//"videoCover": "",
//"videoTime": "",
//"videoUrl": "",
//"viewCount": 1903
@interface RecommendModel : NSObject
@property   (nonatomic,copy)   NSString *avatar;//头像
@property   (nonatomic,copy)   NSString *name;//人名
@property   (nonatomic,copy)   NSString *createTimeStr;//时间
@property   (nonatomic,copy)   NSString *size;//视频封面大小544*960

@property   (nonatomic,copy)   NSString *viewCount;//观看次数
@property   (nonatomic,copy)   NSString *videoCommentTimes;//评论次数
@property   (nonatomic,copy)   NSString *totalGoodNums;//点赞次数
@property   (nonatomic,copy)   NSString *shareTimes;//分享次数


@property   (nonatomic,copy)   NSString *videoUrl;//视频路径
@property   (nonatomic,copy)   NSString *videoCover;//视频封面
@property   (nonatomic,copy)   NSString *descriptionStr;//描述
@property   (nonatomic,copy)   NSString *groupName;//描述里面的#



@end
