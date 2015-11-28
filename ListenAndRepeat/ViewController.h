//
//  ViewController.h
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 15..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@class Player;

@interface ViewController : NSViewController

@property Player *player;

@property NSTimer *timer;

@property (weak) IBOutlet NSTextField *fileName;
@property (weak) IBOutlet NSTextField *currentTime;
@property (weak) IBOutlet NSTextField *duration;
@property (weak) IBOutlet NSSlider *timeSlider;

@property (weak) IBOutlet NSButton *playButton;
@property (weak) IBOutlet NSButton *playBackwardOneSecButton;
@property (weak) IBOutlet NSButton *playBackwardThreeSecButton;
@property (weak) IBOutlet NSButton *playForwardOneSecButton;
@property (weak) IBOutlet NSButton *playForwardThreeSecButton;

- (IBAction)playSound:(NSButton*) sender;
- (IBAction)playBackwardOneSec:(NSButton *)sender;
- (IBAction)playBackwardThreeSec:(NSButton *)sender;
- (IBAction)playForwardOneSec:(NSButton *)sender;
- (IBAction)playForwardThreeSec:(NSButton *)sender;
- (IBAction)setSlider:(NSSlider *)sender;

@end

@interface ViewController (Private)

- (void) initHotKeys;
- (void) initView;
- (void) initSlider;
- (void) initTimeText;
- (void) initFileName;

- (void) playAt: (NSTimeInterval) offset;
- (NSTimer *) getScheduledTimerForUpdateView;
- (void) updateView:(NSTimer*) targetTimer;
- (void) updateTime: (NSTimeInterval) time;
- (void) updatePlayButton: (BOOL) isPlaying;

@end

