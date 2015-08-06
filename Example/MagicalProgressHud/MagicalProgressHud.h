//
//  MagicalProgressHud.h
//  MagicalProgressHUD
//
//  Created by Muhammad Waqas Bhati on 06/08/2015.
//  Copyright (c) 2015 APPLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicalProgressHud : UIView{
    MagicalProgressHud *hud;
}

@property (nonatomic, strong) UIColor *backGroundColor;

@property (nonatomic) CGFloat *alpha;

@property (nonatomic, strong) UIImageView *movingImage;

@property(nonatomic,copy) NSArray *animationImages;

@property(nonatomic) NSTimeInterval animationDuration;

@property(nonatomic) NSInteger  animationRepeatCount; 


/**
 * Creates a new HUD, adds it to provided view and shows it. The counterpart to this method is hideHUDForView:animated:.
 *
 * @param view The view that the HUD will be added to
 * @param animated If set to YES the HUD will appear using the current animationType. If set to NO the HUD will not use
 * animations while appearing.
 * @return A reference to the created HUD.
 *
 * @see hideHUDForView:animated:
 * @see animationType
 */
+ (instancetype)flyingHudAddedTo:(UIView *)view;

/**
 * Finds the top-most HUD subview and hides it. The counterpart to this method is showHUDAddedTo:animated:.
 *
 * @param view The view that is going to be searched for a HUD subview.
 * @param animated If set to YES the HUD will disappear using the current animationType. If set to NO the HUD will not use
 * animations while disappearing.
 * @return YES if a HUD was found and removed, NO otherwise.
 *
 * @see showHUDAddedTo:animated:
 * @see animationType
 */
+ (void)flyingHudRemoveFrom:(UIView *)view;


@end
