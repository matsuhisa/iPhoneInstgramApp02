//  TagsManager.m
//  InstagramApp02

#import "TagsManager.h"

@implementation TagsManager

// singleton ？
+ (TagsManager *)sharedManager
{
    static TagsManager *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

@end
