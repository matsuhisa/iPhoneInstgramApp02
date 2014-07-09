//  MasterViewController.m
//  InstagramApp02

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TagsViewController.h"
#import "PhotosManager.h"
#import "PhotoListCell.h"

@interface MasterViewController ()
- (void)initializeTags;
@end

@implementation MasterViewController

// 初期化の実行
- (id)init {
    if (self = [super init]) {
        [self initializeTags];
        return self;
    }
    return nil;
}

- (void)initializeTags
{
    NSMutableArray *tempTags = [[NSMutableArray alloc] init];
    self.tags = tempTags;
}

// 巻き戻しセグエ
// - タグ追加
-(IBAction)tags:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        TagsViewController *tagsViewController = [segue sourceViewController];
        
        if([tagsViewController.tag length] > 0)
        {
            [self.tags addObject:tagsViewController.tag];
            NSLog(@"%lu", (unsigned long)[self.tags count]);
            [self fetchData:tagsViewController.tag];
        }
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initializeTags];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchData:@"ラーメン"];
}

// データー読み込み
- (void)fetchData:(NSString *)tag
{
    NSString *_tags = @"京都";
    if([tag length] > 0)
    {
        _tags = tag;
    }

    NSLog(@"-------------");
    NSLog(@"fetchData -> %@",_tags);
    NSLog(@"-------------");

    NSString *tags         = [_tags stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    NSString *base_url     = @"https://api.instagram.com/v1/tags/";
    NSString *access_token = @"228314.f59def8.b2923efc7b794cd080eb1ade6a329dd2";
    NSString *post_url     = [NSString stringWithFormat:@"%@%@/media/recent?access_token=%@",base_url,tags,access_token];
    
    NSURL *url = [NSURL URLWithString:post_url];
    NSLog(@"%@", url);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [PhotosManager sharedManager].photos = [NSMutableArray array];
    
    NSURLSessionDataTask *task =
    [session dataTaskWithURL:url
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
     {
         if (error)
         {
             // 通信が異常終了したときの処理
             return;
         }
         
         // 通信が正に常終了したときの処理
         NSError *jsonError = nil;
         NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
         
         // JSONエラーチェック
         if (jsonError != nil) return;
         
         // 検索結果をディクショナリにセット
         [PhotosManager sharedManager].photos = jsonDictionary[@"data"];
         
         // TableView をリロード
         // メインスレッドでやらないと最悪クラッシュする
         [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
         //[session invalidateAndCancel];
     }];
    
    // 通信開始
    [task resume];
}

// テーブルビューを再描画する
- (void)reloadTableView
{
    [self.tableView reloadData];
}

//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // データーの取得
    NSDictionary *photo = [PhotosManager sharedManager].photos[indexPath.row];
    
    // セルの生成
    PhotoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.likeCount    = photo[@"likes"][@"count"];
    cell.fullName     = photo[@"caption"][@"from"][@"full_name"];
    cell.text         = photo[@"caption"][@"text"];
    cell.mainImageUrl = photo[@"images"][@"standard_resolution"][@"url"];
    cell.userImageUrl = photo[@"user"][@"profile_picture"];

    return cell;
}

//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PhotosManager sharedManager] countOfList];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
    }

    if ([[segue identifier] isEqualToString:@"showTags"]) {
        TagsViewController *tagsViewController = [segue destinationViewController];
        [tagsViewController setTags:self.tags];
        NSLog(@"-------------");
        NSLog(@"showTags");
        NSLog(@"-------------");

    }
}

@end
