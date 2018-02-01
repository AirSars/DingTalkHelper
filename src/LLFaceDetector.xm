#import "DingTalkHelper.h"
#import "LLPunchConfig.h"
#import "LLPunchManager.h"

%hook VSWatermarkCameraViewController

- (void)takePictureWithImage:(id)image animated:(BOOL)animated{
    %orig([LLPunchManager shared].punchConfig.isOpenAutoReplacePhoto?image:image,animated);
}

%end

%subclass LLReplacePhotoSettingController : DTTableViewController

%property (nonatomic, assign) BOOL isOpenReplacePhoto;
%property (nonatomic, retain) UIImage *replacePhoto;

- (void)viewDidLoad {
    %orig;

    [self setNavigationBar];
    [self tidyDataSource];
}

%new
- (void)setNavigationBar{
    self.title = @"替换照片设置";
    self.view.backgroundColor = [UIColor whiteColor];
}

%new
- (void)tidyDataSource{
    DTCellItem *openReplacePhotoItem = [NSClassFromString(@"DTCellItem") cellItemForSwitcherStyleWithTitle:@"是否开启照片替换" isSwitcherOn:self.punchConfig.isOpenPunchHelper switcherValueDidChangeBlock:^(DTCellItem *item,DTCell *cell,UISwitch *aSwitch){
        self.isOpenReplacePhoto = aSwitch.on;
    }];
    DTSectionItem *switchSectionItem = [NSClassFromString(@"DTSectionItem") itemWithSectionHeader:nil sectionFooter:@"配置好照片并且打卡开关即可替换打卡拍照"];
    switchSectionItem.dataSource = @[openReplacePhotoItem];

    DTTableViewDataSource *dataSource = [[NSClassFromString(@"DTTableViewDataSource") alloc] init];
    dataSource.tableViewDataSource = @[switchSectionItem];
    self.dataSource = dataSource;

    [self.tableView setTableFooterView:[UIImage imageNamed:@""]]
    [self.tableView reloadData];
}

%end

%hook UINavigationController

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated{
[[[UIApplication sharedApplication].keyWindow viewWithTag:1001] removeFromSuperview];
    UILabel *lbl = [UILabel new];
    lbl.text = [controller description];
    lbl.frame = CGRectMake(0,0,320,480);
    lbl.numberOfLines = 0;
    lbl.tag = 1001;
    lbl.textColor = [UIColor colorWithRed:( arc4random() % 256 ) / 255.0 green:( arc4random() % 256 ) / 255.0 blue:( arc4random() % 256 ) / 255.0 alpha:1];
    [[UIApplication sharedApplication].keyWindow addSubview:lbl];
    %orig;
}

%end