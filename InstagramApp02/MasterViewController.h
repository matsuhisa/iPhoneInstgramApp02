//  MasterViewController.h
//  InstagramApp02

@class TagsManager;

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

// 巻き戻しセグエ
-(IBAction)tags:(UIStoryboardSegue *)segue;

//
//@property (strong, nonatomic) TagsManager *tagsManager;
@property (nonatomic, strong) NSMutableArray *tags;

@end
