//
//  MagicalProgressHud.m
//  MagicalProgressHUD
//
//  Created by Muhammad Waqas Bhati on 06/08/2015.
//  Copyright (c) 2015 APPLE. All rights reserved.
//

#import "MagicalProgressHud.h"

@implementation MagicalProgressHud

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)flyingHudAddedTo:(UIView *)view{
    MagicalProgressHud *hud = [[self alloc] initWithFrame:view.bounds];
    [hud addSubview:hud.movingImage];
    [view addSubview:hud];
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
    _movingImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-50.0,self.frame.size.height/2-50.0,100,100)];
    
    //Add images which will be used for the animation using an array. Here I have created an array on the fly
    _movingImage.animationImages = self.animationImages;
    
    //Set the duration of the entire animation
    _movingImage.animationDuration = self.animationDuration;
    
    //Set the repeat count. If you don't set that value, by default will be a loop (infinite)
    // explosion.animationRepeatCount = 1;
    
    //Start the animationrepeatcount
    [_movingImage startAnimating];
    
    return _movingImage;
}
- (void)setBackGroundColor:(UIColor *)backGroundColor{
   
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
}
- (id)initWithFrame:(CGRect)frame{
   
    self = [super initWithFrame:frame];
    if (self) {
     
        self.animationDuration = 0.30;
        self.animationImages = @[[UIImage imageNamed:@"wings_1.png"],
                                 [UIImage imageNamed:@"wings_2.png"],
                                 [UIImage imageNamed:@"wings_3.png"],
                                 [UIImage imageNamed:@"wings_4.png"],
                                 [UIImage imageNamed:@"wings_5.png"],
                                 [UIImage imageNamed:@"wings_6.png"],
                                 [UIImage imageNamed:@"wings_7.png"],
                                 [UIImage imageNamed:@"wings_8.png"],
                                 [UIImage imageNamed:@"wings_9.png"],
                                 [UIImage imageNamed:@"wings_10.png"],
                                 [UIImage imageNamed:@"wings_11.png"],
                                 [UIImage imageNamed:@"wings_12.png"],
                                 [UIImage imageNamed:@"wings_13.png"]
                                 ];
        self.backGroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];
        self.contentMode = UIViewContentModeCenter;
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
								| UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    return self;
}
@end
