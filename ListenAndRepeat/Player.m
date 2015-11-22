//
//  Player.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 22..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id) init {
    NSURL *path = [self openFile];
    NSError *error;
    
    self = [super initWithContentsOfURL:path error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        [self prepareToPlay];
    }
    
    return self;
}

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

@end
