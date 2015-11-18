//
//  ViewController.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 15..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "ViewController.h"

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
    [self setTimer:nil];
    
    NSOpenPanel *openFileDialog = [NSOpenPanel openPanel];
    
    [openFileDialog setCanChooseFiles:YES];
    [openFileDialog setAllowsMultipleSelection:NO];
    
    if ([openFileDialog runModal] == NSModalResponseOK) {
        NSURL *path = [[openFileDialog URLs] objectAtIndex:0];
        
        NSError *error;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            [player prepareToPlay];
        }
        
        [timeSlider setMinValue:0.0];
        [timeSlider setMaxValue:[player duration]];
    
        [player setDelegate:self];
        
        [fileName setStringValue:[[path path] lastPathComponent]];
        
        [currentTime setStringValue:[self getFormattedTime:0]];
        [duration setStringValue:[self getFormattedTime:[player duration]]];
        [timeSlider setDoubleValue:0];
    }
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
        
        [sender setTitle:@"Play"];
    } else {
        [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSlider:) userInfo:player repeats:YES]];
        
        [player play];
        
        [sender setTitle:@"Stop"];
    }
}

- (void)updateSlider:(NSTimer*) targetTimer {
    if (player == [timer userInfo] && [player isPlaying]) {
        [timeSlider setDoubleValue:[player currentTime]];
        [currentTime setStringValue:[self getFormattedTime:[player currentTime]]];
    }
}

- (NSString*)getFormattedTime:(int) seconds {
    return [NSString stringWithFormat:@"%02d:%02d:%02d", seconds / 3600, (seconds / 60) % 60, seconds % 60];
}

@end
