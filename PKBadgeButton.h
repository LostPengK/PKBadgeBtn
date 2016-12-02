//
//  PKBadgeButton.h
//  app
//
//  Created by pengkang on 16/11/28.
//  Copyright © 2016年 jphd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKBadgeButton : UIButton

//offset x  to button
-(void)setBadgeView:(UIView *)view rightOffset:(CGFloat)rightOffset  topOffset:(CGFloat)topOffset;

//if index ==0 ,badge view is hidden;
-(void)setBadgeNumber:(NSInteger)index rightOffset:(CGFloat)rightOffset  topOffset:(CGFloat)topOffset;

-(void)removeBadge;

@end
