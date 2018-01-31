#import "DingTalkHelper.h"
#import "LLPunchConfig.h"
#import "LLPunchManager.h"

%subclass LLRewardController : UIViewController

- (void)viewDidLoad {
    %orig;

    [self setNavigationBar];
    [self setupUI];
}

%new
- (void)setNavigationBar{
    self.title = @"打赏作者";
    self.view.backgroundColor = [UIColor whiteColor];
}

%new
- (void)setupUI{
	NSString *urlPrefix = @"https://github.com/kevll/WeChatRedEnvelopesHelper/blob/master/screenshots/";
	NSArray *imgUrls = @[@"wechatpay.png",@"alipay.png"];
	CGFloat screenW = CGRectGetWidth([UIScreen mainScreen].bounds);
	CGFloat screenH = CGRectGetHeight([UIScreen mainScreen].bounds);
	for(int i = 0; i < 2; i++){
		UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,i*screenH/2.0f,screenW,screenH)];
		[imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",urlPrefix,imgUrls[i]]]];
		imgView.backgroundColor = [UIColor redColor];
	    [self.view addSubview:imgView];
	    UILongPressGestureRecognizer *longPressGest = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
	    [imgView addGestureRecognizer:longPressGest];
	}
}

%end