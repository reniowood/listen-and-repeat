//
//  ViewController.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 15..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "HotKey.h"
#import "Player.h"

@implementation ViewController

@synthesize player;
@synthesize timer;

@synthesize fileName;
@synthesize currentTime;
@synthesize duration;
@synthesize timeSlider;

@synthesize playButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self setPlayer:[[Player alloc] init]];
    [self initHotKeys];
    
    [self setTimer:nil];
    
    [self initView];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)playSound:(NSButton *) sender {
    if ([player isPlaying] == YES) {
        [timer invalidate];
        [self setTimer:nil];
        
        [player stop];
        
        [playButton setTitle:@"Play"];
    } else {
        [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSlider:) userInfo:player repeats:YES]];
        
        [player play];
        
        [playButton setTitle:@"Stop"];
    }
}

- (IBAction)playBackwardOneSec:(NSButton *)sender {
    [self playAt: -1.0];
}

- (IBAction)playBackwardThreeSec:(NSButton *)sender {
    [self playAt: -3.0];
}

- (IBAction)playForwardOneSec:(NSButton *)sender {
    [self playAt: 1.0];
}

- (IBAction)playForwardThreeSec:(NSButton *)sender {
    [self playAt: 3.0];
}

- (void)updateSlider:(NSTimer*) targetTimer {
    if (player == [timer userInfo] && [player isPlaying]) {
        [self updateTime: [player currentTime]];
    }
}

- (NSString*)getFormattedTime:(int) seconds {
    return [NSString stringWithFormat:@"%02d:%02d:%02d", seconds / 3600, (seconds / 60) % 60, seconds % 60];
}

@end

@implementation ViewController (Private)

- (void) initHotKeys {
    HotKey *hotKeyHandler = [[HotKey alloc] init];
    [hotKeyHandler setupHotKeys: self];
}

- (void) initView {
    [self initFileName];
    [self initSlider];
    [self initTimeText];
}

- (void) initSlider {
    [timeSlider setMinValue:0.0];
    [timeSlider setMaxValue:[player duration]];
    [timeSlider setDoubleValue:0];
}

- (void) initTimeText {
    [currentTime setStringValue:[self getFormattedTime:0]];
    [duration setStringValue:[self getFormattedTime:[player duration]]];
}

- (void) initFileName {
    [fileName setStringValue:[[player url] lastPathComponent]];
}

- (void) updateTime: (NSTimeInterval) time {
    [timeSlider setDoubleValue:time];
    [currentTime setStringValue:[self getFormattedTime:time]];
}

- (void) playAt:(NSTimeInterval) offset {
    [player setCurrentTime:([player currentTime] + offset)];
    
    [self updateTime: [player currentTime]];
}

@end
