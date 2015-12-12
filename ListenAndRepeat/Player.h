//
//  Player.h
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 22..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface Player : NSObject

@property AVAudioPlayer *audioPlayer;

@property NSString *filename;
@property double duration;

+ (Player *) getInstance;

- (void) openAudioFile;
- (void) toggle;
- (float) getVolume;
- (void) setVolume: (float) volume;

@end

@interface Player (Private)

- (NSURL *) openFile;
- (void) initPlayer: (NSURL *) path;

@end