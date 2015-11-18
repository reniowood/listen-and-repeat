//
//  ViewController.h
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 15..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AVFoundation/AVFoundation.h>

@interface ViewController : NSViewController <AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) NSTimer *timer;

@property (nonatomic, retain) IBOutlet NSTextField *fileName;
@property (nonatomic, retain) IBOutlet NSTextField *currentTime;
@property (nonatomic, retain) IBOutlet NSTextField *duration;
@property (nonatomic, retain) IBOutlet NSSlider *timeSlider;

@property (nonatomic, retain) IBOutlet NSButton *playButton;

- (IBAction)playSound:(NSButton*) sender;
- (void)updateSlider:(NSTimer*) timer;

- (NSString*)getFormattedTime:(int) seconds;

@end

