//  PhotosManager.h
//  InstagramApp02

#import <Foundation/Foundation.h>

@class Photo;

@interface PhotosManager : NSObject

@property (nonatomic, copy) NSMutableArray *photos;

+ (PhotosManager *)sharedManager;

//- (void)reloadPhotosWithBlock:(void (^)(NSError *error))block;

// データーを数える
- (NSUInteger)countOfList;

// 指定のデーターを返す
//- (Photo *)objectInListAtIndex:(NSIndexPath *)indexPath;

@end
