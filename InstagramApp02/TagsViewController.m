//  TagsViewController.m
//  InstagramApp02

#import "TagsViewController.h"

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

// テーブル全体のセクションの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // sefl.sectionList などで管理するのがいい
    //return 2;
    return 0;
}

// セクションごとに生成するセルの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // セクションごとに設定する事も可能
    // section で判別する
    return 1;
}

// セクション毎のタイトル
// - いらなければとる
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%d 番目のセクション", section];
}
*/


// セルの生成
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
/*
    if (indexPath.section==0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"InputCell" forIndexPath:indexPath];
    }
    
    if (indexPath.section==1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell" forIndexPath:indexPath];
    }
*/
    return cell;
}

- (IBAction)TagDone:(id)sender {
}
@end
