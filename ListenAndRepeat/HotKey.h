//
//  HotKey.h
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 22..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import <Carbon/Carbon.h>

@class ViewController;

@interface HotKey : NSObject

- (void) setupHotKeys: (ViewController *) viewController;

@end