//  PhotosManager.m
//  InstagramApp02

#import "PhotosManager.h"

@implementation PhotosManager

// singleton ？
+ (PhotosManager *)sharedManager
{
    static PhotosManager *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (void)reloadPhotosWithBlock:(void (^)(NSError *error))block
{
}

- (NSUInteger)countOfList
{
    return [self.photos count];
}

@end
