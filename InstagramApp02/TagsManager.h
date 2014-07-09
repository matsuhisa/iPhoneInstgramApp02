//  TagsManager.h
//  InstagramApp02

#import <Foundation/Foundation.h>

@class Tag;

@interface TagsManager : NSObject

@property (nonatomic, copy) NSMutableArray *tags;
//@property (nonatomic, copy) NSArray *tags;

// タグの追加
- (void)addTag:(NSString *)tag;

// カウント
- (NSUInteger)countOfList;

// 指定のタグを返す
- (Tag *)objectInListAtIndex:(NSUInteger)theIndex;

//+ (TagsManager *)sharedManager;

@end
