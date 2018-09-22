//
//  NSMouseCapture.m
//  Screen_Capture
//
//  Created by scott lee on 1/11/17.
//
//

#import <Foundation/Foundation.h>
#import <appkit/appkit.h>
#import "NSMouseCapture.h"

void SLScreen_Capture_InitMouseCapture(){
    [NSApplication sharedApplication];
}
SL_MouseCur SLScreen_Capture_GetCurrentMouseImage(){
	SL_MouseCur ret= {}; 
 
    @autoreleasepool {
        NSCursor *cur = [NSCursor currentSystemCursor];
        if(cur==nil) return ret;
        NSImage *overlay    =  [cur image];
        CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)[overlay TIFFRepresentation], NULL);
        ret.Image = CGImageSourceCreateImageAtIndex(source, 0, NULL);
		ret.HotSpot = [cur hotSpot];
        CFRelease(source);
    }
 
    return ret;
} 