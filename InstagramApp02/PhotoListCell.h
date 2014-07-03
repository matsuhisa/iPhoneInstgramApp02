//  PhotoListCell.h
//  InstagramApp02

#import <UIKit/UIKit.h>

@protocol PhotoListCellDelegate;
@interface PhotoListCell : UITableViewCell

@property (nonatomic, weak) id <PhotoListCellDelegate> delegate;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *mainImageUrl;
@property (nonatomic, copy) NSString *userImageUrl;
@property (nonatomic, copy) NSNumber *likeCount;

@end

@protocol PhotoListCellDelegate <NSObject>
@end