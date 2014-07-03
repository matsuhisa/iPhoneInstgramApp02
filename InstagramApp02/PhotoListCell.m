//  PhotoListCell.m
//  InstagramApp02

#import "PhotoListCell.h"

@interface PhotoListCell()
@property (weak, nonatomic) IBOutlet UILabel *LikeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *FullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *TextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *MainImage;
@property (weak, nonatomic) IBOutlet UIImageView *UserImage;
@end

@implementation PhotoListCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)setFullName:(NSString *)newFullName
{
    _fullName = newFullName;
    self.FullNameLabel.text = _fullName;
}

-(void)setText:(NSString *)newText
{
    _text = newText;
    self.TextLabel.text = _text;
}

-(void)setLikeCount:(NSNumber *)newLikeCount
{
    _likeCount = newLikeCount;
    self.LikeCountLabel.text = [_likeCount stringValue];
}

-(void)setUserImageUrl:(NSString *)newUserImageUrl
{
    _userImageUrl = newUserImageUrl;

    // 画像取得
    NSURL *image_url = [NSURL URLWithString:self.userImageUrl];
    
    // セッションを用意する
    // - タイムアウトの時間などを設定可能らしい
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    // タスクの設定をする
    NSURLSessionDataTask* task =
    [session dataTaskWithURL:image_url
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
               
               // オリジナル画像
               UIImage* image = [UIImage imageWithData:data];
               
               // 設定
               _UserImage.contentMode = UIViewContentModeScaleAspectFit;
               
               // UIImageVIewを更新する
               dispatch_async(dispatch_get_main_queue(), ^{
                   _UserImage.image = image;
               });
           }];
    
    [task resume];
}

-(void)setMainImageUrl:(NSString *)newMainImageUrl
{
    _mainImageUrl = newMainImageUrl;
    
    // 画像取得
    NSURL *image_url = [NSURL URLWithString:self.mainImageUrl];

    // セッションを用意する
    // - タイムアウトの時間などを設定可能らしい
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    // タスクの設定をする
    NSURLSessionDataTask* task =
    [session dataTaskWithURL:image_url
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
               
               // オリジナル画像
               UIImage* image = [UIImage imageWithData:data];

               // 設定
               _MainImage.contentMode = UIViewContentModeScaleAspectFit;
               
               // UIImageVIewを更新する
               dispatch_async(dispatch_get_main_queue(), ^{
                   _MainImage.image = image;

               });
           }];
    
    [task resume];
}

@end
