//  TagsViewController.m
//  InstagramApp02

#import "TagsViewController.h"
#import "TagsManager.h"
#import "Tag.h"

@interface TagsViewController ()
@end

@implementation TagsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// マスターに送信する
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if([self.InputTag.text length] > 0)
        {
            _tag = self.InputTag.text;
        }else{
            _tag = @"寿司";
        }
    }
}


// セクションごとに生成するセルの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tags count];
    //return 3;
    //return [self.tagsManager countOfList];
}

// セルの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *saveTag = [self.tags objectAtIndex:indexPath.row];
    cell.textLabel.text = saveTag;

    //Tag *tag = [self.tagsManager objectInListAtIndex:indexPath.row];
    //cell.textLabel.text = tag.label;
    //cell.textLabel.text = @"テストです";
    return cell;
}

- (void)setTags:(NSMutableArray *)newTags
{
    NSLog(@"------------");
    NSLog(@"setTags");
    NSLog(@"------------");
    if(_tags != newTags)
    {
        _tags = newTags;
    }
    [self.TagHistory reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"------------");
    NSLog(@"viewWillAppear");
    NSLog(@"------------");
    [super viewWillAppear:animated];
    [self.TagHistory reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"------------");
    NSLog(@"viewWillDisappear");
    NSLog(@"------------");
    [super viewWillDisappear:animated];
}

- (IBAction)TagDone:(id)sender
{
}

@end
