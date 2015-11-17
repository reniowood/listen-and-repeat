//
//  ViewController.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 15..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize playButton;
@synthesize isPlaying;
@synthesize player;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setPlayButton:nil];
    
    NSOpenPanel *openFileDialog = [NSOpenPanel openPanel];
    
    [openFileDialog setCanChooseFiles:YES];
    [openFileDialog setAllowsMultipleSelection:NO];
    
    if ( [openFileDialog runModal] == NSModalResponseOK) {
        NSArray *paths = [openFileDialog URLs];
        
        NSError *error;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:[paths objectAtIndex:0] error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            [player prepareToPlay];
        }
        
        [player setDelegate:self];
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)playSound:(NSButton *)sender {
    if ([self isPlaying] == YES) {
        [player stop];
        
        [self setIsPlaying:NO];
        [sender setTitle:@"Play"];
    } else {
        [player play];
        
        [self setIsPlaying:YES];
        [sender setTitle:@"Stop"];
    }
}

@end
