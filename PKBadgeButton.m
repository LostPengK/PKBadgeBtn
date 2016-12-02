//
//  PKBadgeButton.m
//  app
//
//  Created by pengkang on 16/11/28.
//  Copyright © 2016年 jphd. All rights reserved.
//

#define  BadgeLabelHeight  16
#import "PKBadgeButton.h"

@interface PKBadgeButton()

@property(nonatomic,strong)UIView *badgeView;

@property(nonatomic,strong)UILabel *badgeLa;

@end

@implementation PKBadgeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)setBadgeView:(UIView *)view rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset{
    if (!view) {
        return;
    }
    [self.badgeLa setHidden:YES];
    self.badgeView = view;
    self.badgeView.hidden = NO;
    [self addSubview:self.badgeView];
    self.badgeView = view;
    CGRect frame = self.badgeView.frame;
    frame.origin.x = self.frame.size.width - rightOffset - view.frame.size.width;
    frame.origin.y = topOffset;
    self.badgeView.frame = frame;
}

-(void)setBadgeNumber:(NSInteger)index rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset{
    self.badgeView.hidden = YES;
    if (index==0) {
        [self.badgeLa setHidden:YES];
        return;
    }else{
        [self.badgeLa setHidden:NO];
        [self addSubview:self.badgeLa];
        NSString *text = [NSString stringWithFormat:@"%ld",index];
        CGSize textSize = [text boundingRectWithSize:CGSizeMake(100, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        CGFloat laWidth = MAX(BadgeLabelHeight, textSize.width);
        self.badgeLa.text = text;

        CGRect frame = self.badgeLa.frame;
        frame.origin.x = self.frame.size.width - rightOffset - laWidth;
        frame.origin.y = topOffset;
        frame.size = CGSizeMake(laWidth, BadgeLabelHeight);
        self.badgeLa.frame = frame;
    }
}

-(void)removeBadge{
    self.badgeView.hidden = YES;
}

#pragma mark getter setter

//default height = 16;
-(UILabel *)badgeLa{
    if (!_badgeLa) {
        _badgeLa = [UILabel new];
        _badgeLa.backgroundColor = [UIColor redColor];
        _badgeLa.font = [UIFont systemFontOfSize:14];
        _badgeLa.textColor = [UIColor whiteColor];
        _badgeLa.textAlignment = NSTextAlignmentCenter;
        _badgeLa.layer.cornerRadius = 8;
        _badgeLa.clipsToBounds = YES;
    }
    return _badgeLa;
}

@end
