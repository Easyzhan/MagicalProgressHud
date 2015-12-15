//
//  MagicalProgressHud.m
//  MagicalProgressHUD
//
//  Created by Muhammad Waqas Bhati on 06/08/2015.
//  Copyright (c) 2015 APPLE. All rights reserved.
//

#import "MagicalProgressHud.h"

UIRefreshControl *refreshControl;

static UIColor *backColor;

static CGFloat *alpha;

static UIImageView *movingImage;

static NSArray *animationImages;

static NSTimeInterval animationDuration;

static NSInteger  animationRepeatCount;


@implementation MagicalProgressHud

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)setBackColor:(UIColor*)color{
    backColor = color;
}
+ (void)setAlpha:(CGFloat)alphaTemp{
    alpha = &alphaTemp;
}
+ (void)setMovingImage:(UIImageView *)image{
    movingImage = image;
}
+ (void)setAnimationImages:(NSArray *)images{
    animationImages = images;
}
+ (void)setAnimationDuration:(NSTimeInterval)duration{
    animationDuration = duration;
}
+ (void)setanimationRepeatCount:(NSInteger)count{
    animationRepeatCount = count;

}

+ (instancetype)flyingHudAddedTo:(UIView *)view{
    MagicalProgressHud *hud = nil;
    if ([view isKindOfClass:[UITableView class]]) {
        hud = [[self alloc] initWithFrame:refreshControl.bounds];
        hud.frame = refreshControl.frame;
        [hud addSubview:hud.movingImage];
        [refreshControl addSubview:hud];
        [view addSubview:refreshControl];
    }
    else if ([view isKindOfClass:[UIView class]]){
        hud = [[self alloc] initWithFrame:view.bounds];
        [hud addSubview:hud.movingImage];
        [view addSubview:hud];
    }
    
    return hud;
}

+ (void)flyingHudRemoveFrom:(UIView *)view{

    MagicalProgressHud *hud = [self HUDForView:view];
    if (hud != nil) {
        [hud removeFromSuperview];
    }
}
+ (instancetype)HUDForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (MagicalProgressHud *)subview;
        }
    }
    return nil;
}
- (UIImageView *)movingImage{
    //Position the explosion image view somewhere in the middle of your current view. In my case, I want it to take the whole view.Try to make the png to mach the view size, don't stretch it
    movingImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-50.0,self.frame.size.height/2-50.0,100,100)];
    
    //Add images which will be used for the animation using an array. Here I have created an array on the fly
    movingImage.animationImages = animationImages;
    
    //Set the duration of the entire animation
    movingImage.animationDuration = animationDuration;
    
    //Set the repeat count. If you don't set that value, by default will be a loop (infinite)
    // explosion.animationRepeatCount = 1;
    
    //Start the animationrepeatcount
    [movingImage startAnimating];
    
    return movingImage;
}
- (id)initWithFrame:(CGRect)frame{
   
    self = [super initWithFrame:frame];
    if (self) {
     
        animationDuration = 0.30;
        animationImages = @[[UIImage imageNamed:@"MPHImages.bundle/wings_1.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_2.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_3.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_4.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_5.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_6.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_7.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_8.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_9.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_10.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_11.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_12.png"],
                                 [UIImage imageNamed:@"MPHImages.bundle/wings_13.png"]
                                 ];
        self.contentMode = UIViewContentModeCenter;
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
								| UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        refreshControl = [[UIRefreshControl alloc] init];
        refreshControl.tintColor = [UIColor clearColor];
        [refreshControl addTarget:self
                           action:@selector(getLatestData)
                 forControlEvents:UIControlEventValueChanged];
        if (backColor==nil) {
            self.backgroundColor = [UIColor clearColor];
            refreshControl.backgroundColor = [UIColor purpleColor];
        }
        else{
            self.backgroundColor = backColor;
            refreshControl.backgroundColor = backColor;
        }
    }
    return self;
}
- (void)getLatestData{
    
    // [self hideHud];
      [refreshControl endRefreshing];
    
}
@end
