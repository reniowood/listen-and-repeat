//
//  Player.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 22..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize duration;
@synthesize filename;

+ (Player *) getInstance {
    static dispatch_once_t pred;
    static Player *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[Player alloc] init];
    }); // synchronous way to generate a singleton instance.
    
    return shared;
}

- (Player *) init {
    self = [super init];
    
    [self setDuration:0.0];
    [self setFilename:@"open a file"];
    
    return self;
}

- (void) openAudioFile {
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer stop];
    }
    
    NSURL *path = [self openFile];
    
    if (path == nil) {
        return;
    }
    
    [self initPlayer: path];
    
    [self setDuration:[self.audioPlayer duration]];
    [self setFilename:[[self.audioPlayer url] lastPathComponent]];
    
    [NSApp activateIgnoringOtherApps:YES];
}

- (void) toggle {
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
    } else {
        [self.audioPlayer play];
    }
}

- (float) getVolume {
    return [self.audioPlayer volume];
}

- (void) setVolume: (float) volume {
    [self.audioPlayer setVolume:volume];
}

@end

@implementation Player (Private)

- (NSURL *) openFile {
    NSOpenPanel *openFileDialog = [NSOpenPanel openPanel];
    
    [openFileDialog setFloatingPanel:YES];
    [openFileDialog setCanChooseFiles:YES];
    [openFileDialog setAllowsMultipleSelection:NO];
    
    if ([openFileDialog runModal] != NSModalResponseOK) {
        return nil;
    }
    
    return [[openFileDialog URLs] objectAtIndex:0];
}

- (void) initPlayer: (NSURL *) path {
    NSError *error;
    
    [self setAudioPlayer: [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error]];
    [self.audioPlayer setCurrentTime:0];
    [self.audioPlayer setVolume:0.5];
    [self.audioPlayer stop];
}

@end
