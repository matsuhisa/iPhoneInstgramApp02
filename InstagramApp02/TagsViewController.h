//  TagsViewController.h
//  InstagramApp02

#import <UIKit/UIKit.h>

@interface TagsViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

//@interface TagsViewController : UITableViewController
//<UITextFieldDelegate>

// 入力されたタグ
@property (weak, nonatomic) NSString *tag;

// 入力欄
@property (weak, nonatomic) IBOutlet UITextField *InputTag;

// セグエ
- (IBAction)TagDone:(id)sender;

// タグの履歴テーブル
@property (weak, nonatomic) IBOutlet UITableView *TagHistory;

@end
