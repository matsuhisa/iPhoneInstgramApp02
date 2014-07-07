//  TagsViewController.h
//  InstagramApp02

#import <UIKit/UIKit.h>

@interface TagsViewController : UITableViewController
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *InputTag;
@property (weak, nonatomic) NSString *tag;

- (IBAction)TagDone:(id)sender;


@end
