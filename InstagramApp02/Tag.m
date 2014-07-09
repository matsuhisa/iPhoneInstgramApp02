//  Tag.m
//  InstagramApp02

#import "Tag.h"

@implementation Tag

-(id)initWithName:(NSString *)tag
{
    self = [super init];
    if(self)
    {
        _label = tag;
        return  self;
    }
    return nil;
}

@end
