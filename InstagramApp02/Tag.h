//  Tag.h
//  InstagramApp02

#import <Foundation/Foundation.h>

@interface Tag : NSObject

-(id)initWithName:(NSString *)tag;

@property (nonatomic, copy) NSString *label;
//@property (nonatomic, copy) NSData *created_at;
//@property (nonatomic, copy) NSData *modified_at;

@end
