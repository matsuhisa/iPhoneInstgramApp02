//  TagsViewController.h
//  InstagramApp02

#import <UIKit/UIKit.h>

//@interface TagsViewController : UITableViewController
//<UITextFieldDelegate>

@interface TagsViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>


// 入力されたタグ
@property (weak, nonatomic) NSString *tag;
@property (nonatomic, strong) NSMutableArray *tags;

// 入力欄
@property (weak, nonatomic) IBOutlet UITextField *InputTag;

// セグエ
- (IBAction)TagDone:(id)sender;

// タグの履歴テーブル
@property (weak, nonatomic) IBOutlet UITableView *TagHistory;
-(void)setTags:(NSMutableArray *)tags;

@end
