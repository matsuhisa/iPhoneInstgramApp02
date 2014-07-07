//  TagsManager.h
//  InstagramApp02

#import <Foundation/Foundation.h>

@interface TagsManager : NSObject

@property (nonatomic, copy) NSMutableArray *tags;

+ (TagsManager *)sharedManager;

@end
