//
//  HotKey.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 22..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "HotKey.h"
#import "ViewController.h"

OSStatus hotKeyHandler(EventHandlerCallRef nextHandler, EventRef eventRef, void *userData);

@implementation HotKey

- (void)setupHotKeys: (ViewController *) viewController {
    EventHotKeyRef eventHotKeyRef;
    EventHotKeyID eventHotKeyID;
    EventTypeSpec eventTypeSpec;
    
    eventTypeSpec.eventClass = kEventClassKeyboard;
    eventTypeSpec.eventKind = kEventHotKeyPressed;
    InstallApplicationEventHandler(&hotKeyHandler, 1, &eventTypeSpec, (__bridge void*)viewController, NULL);
    
    eventHotKeyID.signature = 'lrps';
    eventHotKeyID.id = 1;
    RegisterEventHotKey(kVK_Space, optionKey, eventHotKeyID, GetApplicationEventTarget(), 0, &eventHotKeyRef);
    
    eventHotKeyID.signature = 'lrb1';
    eventHotKeyID.id = 2;
    RegisterEventHotKey(kVK_ANSI_X, optionKey, eventHotKeyID, GetApplicationEventTarget(), 0, &eventHotKeyRef);
    
    eventHotKeyID.signature = 'lrb3';
    eventHotKeyID.id = 3;
    RegisterEventHotKey(kVK_ANSI_Z, optionKey, eventHotKeyID, GetApplicationEventTarget(), 0, &eventHotKeyRef);
    
    eventHotKeyID.signature = 'lra1';
    eventHotKeyID.id = 4;
    RegisterEventHotKey(kVK_ANSI_C, optionKey, eventHotKeyID, GetApplicationEventTarget(), 0, &eventHotKeyRef);
    
    eventHotKeyID.signature = 'lra3';
    eventHotKeyID.id = 5;
    RegisterEventHotKey(kVK_ANSI_V, optionKey, eventHotKeyID, GetApplicationEventTarget(), 0, &eventHotKeyRef);
}

@end

OSStatus hotKeyHandler(EventHandlerCallRef nextHandler, EventRef eventRef, void *userData) {
    EventHotKeyID eventHotKeyID;
    ViewController *viewController = (__bridge ViewController *)userData;
    
    GetEventParameter(eventRef, kEventParamDirectObject, typeEventHotKeyID, NULL, sizeof(eventHotKeyID), NULL, &eventHotKeyID);
    
    switch (eventHotKeyID.id) {
        case 1:
            [viewController playSound:nil];
            
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        default:
            break;
    }
    
    return noErr;
}
