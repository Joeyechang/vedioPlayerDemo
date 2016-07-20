//
//  ViewController.m
//  VedioPlayer
//
//  Created by reese on 14/12/28.
//  Copyright (c) 2014年 itcast.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinish)  name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}


-(MPMoviePlayerController *)mp{
    if (!_mp) {
        _mp=[MPMoviePlayerController new];
        
    }
    return _mp;
}


- (IBAction)playWithViewController:(id)sender {
    
    NSURL *url= [[NSBundle mainBundle]URLForResource:@"promo_full.mp4" withExtension:nil];
    MPMoviePlayerViewController *mpvc= [[MPMoviePlayerViewController alloc]initWithContentURL:url];
   /// [self.navigationController pushViewController:mpvc animated:YES];
    
    [self presentViewController:mpvc animated:YES completion:nil];
    
    
}


- (IBAction)play {
    
    
    NSURL *url= [[NSBundle mainBundle]URLForResource:@"Alizee_La_Isla_Bonita.mp4" withExtension:nil];
   
    [self.mp setContentURL:url];
    
    
    _mp.view.translatesAutoresizingMaskIntoConstraints=NO;
    [_playZone addSubview:_mp.view];
    
    
    NSString *vfl = @"H:|-hPadding-[mpv]-hPadding-|";
    
    [_playZone addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:0 metrics:@{@"hPadding":@20} views:@{@"mpv":_mp.view}]];
    
    [_playZone addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vPadding-[mpv]-vPadding-|" options:NSLayoutFormatAlignAllCenterX metrics:@{@"vPadding":@80} views:@{@"mpv":_mp.view}]];
    
    
    [_mp play];
    
    
    [_mp setScalingMode:MPMovieScalingModeAspectFill];
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    
    //[swipe setDirection:UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown];
    [_mp.view addGestureRecognizer:swipe];
    
    
}


-(void)movieFinish
{
    [_mp.view removeFromSuperview];
    _mp =nil;
}



-(void)swipe:(UISwipeGestureRecognizer*)gesture{

    NSLog(@"%zd",gesture.direction);

}

@end
