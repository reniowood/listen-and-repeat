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

@property (weak) IBOutlet NSButton *toggleVolume;
@property (weak) IBOutlet NSSlider *volumeSlider;

- (IBAction)slideTimeSlider:(NSSlider *)sender;

- (IBAction)togglePlayer:(NSButton*) sender;
- (IBAction)playBackwardOneSec:(NSButton *)sender;
- (IBAction)playBackwardThreeSec:(NSButton *)sender;
- (IBAction)playForwardOneSec:(NSButton *)sender;
- (IBAction)playForwardThreeSec:(NSButton *)sender;

- (IBAction)toggleVolume:(NSButton *)sender;
- (IBAction)slideVolumeSlider:(NSSlider *)sender;

- (void) volumeUp;
- (void) volumeDown;

@end

@interface ViewController (Private)

- (void) initHotKeys;
- (void) initView;
- (void) initTimeSlider;
- (void) initTimeText;
- (void) initFileName;
- (void) initVolumeSlider;

- (void) playAt: (NSTimeInterval) offset;
- (NSTimer *) getScheduledTimerForUpdateView;
- (void) updateView:(NSTimer*) targetTimer;
- (void) updateTime: (NSTimeInterval) time;
- (void) updatePlayButton: (BOOL) isPlaying;
- (void) toggleVolumeButtonImg;

@end

