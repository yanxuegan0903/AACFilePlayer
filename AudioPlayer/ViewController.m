//
//  ViewController.m
//  AudioPlayer
//
//  Created by vsKing on 2017/7/13.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"

#import "PlayAudio.h"


@interface ViewController ()

@property (nonatomic, strong) PlayAudio *playAudio;

@end

@implementation ViewController

- (PlayAudio *)playAudio{
    if (!_playAudio) {
        _playAudio = [[PlayAudio alloc] init];
    }
    return _playAudio;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"123");
    
    
    UIButton * start = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 60)];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    [start setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:start];
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton * stop = [[UIButton alloc] initWithFrame:CGRectMake(50, 170, 100, 60)];
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    [stop setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:stop];
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void) start{
    
    NSLog(@"点击 start");
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"testfile" ofType:@"aac"];
    
    if (path) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self.playAudio initWithAudio:path];
        });
        
        
    }else{
        NSLog(@"path 不存在");
    }
}


- (void)stop{
    NSLog(@"点击 stop");
    [self.playAudio stop];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
