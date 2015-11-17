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

@property (nonatomic, retain) IBOutlet NSButton *playButton;
@property (nonatomic) BOOL isPlaying;

@property (nonatomic, retain) AVAudioPlayer *player;

- (IBAction)playSound:(NSButton*) sender;

@end

