//  TagsManager.m
//  InstagramApp02

#import "TagsManager.h"
#import "Tag.h"

@implementation TagsManager

- (id)init
{
    NSLog(@"------------");
    NSLog(@"Manager -> init");
    self = [super init];
    if (self) {
        NSMutableArray *tmparray = [NSMutableArray array];
        self.tags = tmparray;
        return self;
    }
    NSLog(@"------------");
    return nil;
}


// 追加
-(void)addTag:(NSString *)tag
{
    NSLog(@"------------");
    NSLog(@"Manager -> addTag");
    NSLog(@"%@", tag);
    Tag *temptag;
    temptag = [[Tag alloc]initWithName:tag];

    [self.tags addObject:temptag];
    NSLog(@"------------");
}

// データーを数える
- (NSUInteger)countOfList {
    return [self.tags count];
}

- (Tag *)objectInListAtIndex:(NSUInteger)theIndex
{
    return [self.tags objectAtIndex:theIndex];
}

@end
