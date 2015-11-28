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
#import "TimeFormatter.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowWillClose:) name:NSWindowWillCloseNotification object:nil];
    
    [self setPlayer:[Player getInstance]];
    [self setTimer:[self getScheduledTimerForUpdateView]];
    
    [self initView];
    [self initHotKeys];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void) windowWillClose:(NSNotification *) notification {
    NSString *closedWindowClassName = NSStringFromClass([notification.object class]);
    
    if ([closedWindowClassName isEqual: @"NSWindow"]) {
        [[self.player audioPlayer] stop];
        [self.timer invalidate];
    }
}

- (IBAction)playSound:(NSButton *) sender {
    [self.player toggle];
    [self updatePlayButton:[[self.player audioPlayer] isPlaying]];
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

- (IBAction)setSlider:(NSSlider *)sender {
    double sliderValue = [sender doubleValue];
    
    [[self.player audioPlayer] setCurrentTime:sliderValue];
    [self.currentTime setDoubleValue:sliderValue];
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
    [self.timeSlider setMinValue:0.0];
    [self.timeSlider setMaxValue:[self.player duration]];
    [self.timeSlider setDoubleValue:0];
}

- (void) initTimeText {
    TimeFormatter *timeFormatter = [[TimeFormatter alloc] init];
    
    [self.currentTime setFormatter:timeFormatter];
    [self.duration setFormatter:timeFormatter];
    
    [self.currentTime setDoubleValue:0.0];
    [self.duration setDoubleValue:[self.player duration]];
}

- (void) initFileName {
    [self.fileName setStringValue:[self.player filename]];
}

- (void) playAt:(NSTimeInterval) offset {
    AVAudioPlayer *audioPlayer = [self.player audioPlayer];

    [audioPlayer setCurrentTime:([audioPlayer currentTime] + offset)];
    
    [self updateTime: [audioPlayer currentTime]];
}

- (NSTimer *) getScheduledTimerForUpdateView {
    return [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateView:) userInfo:self.player repeats:YES];
}

- (void)updateView:(NSTimer*) targetTimer {
    AVAudioPlayer *audioPlayer = [self.player audioPlayer];

    if (self.player == [self.timer userInfo]) {
        [self updateTime: [audioPlayer currentTime]];
        [self updatePlayButton: [audioPlayer isPlaying]];
    }
}

- (void) updateTime: (NSTimeInterval) time {
    [self.timeSlider setDoubleValue:time];
    [self.currentTime setDoubleValue:time];
}

- (void) updatePlayButton: (BOOL) isPlaying {
    if (isPlaying) {
        [self.playButton setTitle:@"Stop"];
    } else {
        [self.playButton setTitle:@"Play"];
    }
}

@end
