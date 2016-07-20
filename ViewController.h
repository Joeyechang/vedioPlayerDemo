//
//  ViewController.h
//  VedioPlayer
//
//  Created by reese on 14/12/28.
//  Copyright (c) 2014年 itcast.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIView *playZone;
@property (nonatomic,strong)  MPMoviePlayerController *mp;

- (IBAction)playWithViewController:(id)sender;
- (IBAction)play;
@end

