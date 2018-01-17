//
//  KSYPlayerViewController.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/25.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYPlayerViewController.h"
#import "AppDelegate.h"
#import "KSYVodPlayControlView.h"

@interface KSYPlayerViewController (){
    
}
@property (nonatomic,strong) UIView* videoView; //视频播放器的view
@property (nonatomic,strong) KSYVodPlayControlView* controlView;

@property (nonatomic,strong) NSMutableArray* registerNotificationArray; //监听的数组
@property (nonatomic,strong) NSURL* playerUrl; //播放的url


@end

@implementation KSYPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    //配置播放器
    [self configurationPlayer];
    //添加监听者
    [self addObserver:self.ksyPlayer];
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark - private methods 私有方法
- (void)configurationPlayer {
    //加载本地视频
    //    NSString* path = [[NSBundle mainBundle] pathForResource:@"618443029.mp4" ofType:nil];
    //    NSURL* url = [NSURL fileURLWithPath:path];
    //    self.playerUrl = [NSURL URLWithString:@"http://60.205.86.217:8585/live4/108381/2018/01/03/10.38.36.082.flv"];

    self.videoView = [[UIView alloc]init];
    [self.view addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(200);
        make.top.equalTo(self.view);
    }];
    
    self.controlView = [[KSYVodPlayControlView alloc]init];
    [self.view addSubview:self.controlView];
    [self.controlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoView);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.videoView);
    }];
    //初始化
    self.ksyPlayer = [[KSYMoviePlayerController alloc]initWithContentURL:self.playerUrl];
    //    self.ksyPlayer.controlStyle = MPMovieControlStyleNone;
    //是否循环播放
    self.ksyPlayer.shouldLoop = YES;
    //是否自动播放
    self.ksyPlayer.shouldAutoplay = YES;
    //
    self.ksyPlayer.scalingMode = MPMovieScalingModeAspectFit;
    [self.videoView addSubview: self.ksyPlayer.view];
    //适配直播
    [self.ksyPlayer.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.videoView);
    }];
    
    //自适应宽高
    _ksyPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //准备播放视频
    [_ksyPlayer prepareToPlay];
    
}

/**
 添加监听者
 */
- (void)addObserver:(KSYMoviePlayerController*)player {
    
    [self registerObserver:MPMediaPlaybackIsPreparedToPlayDidChangeNotification player:player];
    [self registerObserver:MPMoviePlayerPlaybackStateDidChangeNotification player:player];
    [self registerObserver:MPMoviePlayerPlaybackDidFinishNotification player:player];
    [self registerObserver:MPMoviePlayerLoadStateDidChangeNotification player:player];
    [self registerObserver:MPMovieNaturalSizeAvailableNotification player:player];
    [self registerObserver:MPMoviePlayerFirstVideoFrameRenderedNotification player:player];
    [self registerObserver:MPMoviePlayerFirstAudioFrameRenderedNotification player:player];
    [self registerObserver:MPMoviePlayerSuggestReloadNotification player:player];
    [self registerObserver:MPMoviePlayerPlaybackStatusNotification player:player];
    [self registerObserver:MPMoviePlayerNetworkStatusChangeNotification player:player];
    [self registerObserver:MPMoviePlayerSeekCompleteNotification player:player];
}

- (void)registerObserver:(NSString*)notification player:(KSYMoviePlayerController*)player {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayerNotification:) name:(notification) object:player];
    [self.registerNotificationArray addObject: notification];
    
}

/**
 移除监听者
 */
- (void)removeObserver {
    for (NSString* notice in self.registerNotificationArray )
    {
        [[NSNotificationCenter defaultCenter]removeObserver:self name:notice object:self.ksyPlayer];
    }
}

//通知
- (void)handlePlayerNotification:(NSNotification*)notice {
    if (!self.ksyPlayer) {
        return;
    }
    NSLog(@"%@",notice);
}
- (void)shouldRotateToOrientation:(UIDeviceOrientation)orientation {
    if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        [self.videoView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        [self.controlView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.videoView);
            make.width.mas_equalTo(ScreenWidth);
            make.height.mas_equalTo(50);
            make.bottom.equalTo(self.videoView);
        }];
    }
    else{
        [self.videoView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.width.mas_equalTo(ScreenWidth);
            make.height.mas_equalTo(200);
            make.top.equalTo(self.view);
        }];
        [self.controlView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.videoView);
            make.width.mas_equalTo(ScreenWidth);
            make.height.mas_equalTo(50);
            make.bottom.equalTo(self.videoView);
        }];
    }
}

#pragma mark -
#pragma mark - public methods 公有方法
- (instancetype)initWithUrlAndConfigure:(NSURL *)url {
    if (self = [super init]) {
        self.playerUrl = url;
    }
    return self;
}

#pragma mark -
#pragma mark - Override 复写方法
- (void)viewWillLayoutSubviews {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIDeviceOrientation orientation = (UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation;
    [self shouldRotateToOrientation:orientation];
}

- (void)dealloc {
    [self.ksyPlayer stop];
    [self removeObserver];
}

#pragma mark -
#pragma mark - getters and setters 设置器和访问器

//懒加载数组
- (NSMutableArray*)registerNotificationArray {
    if (!_registerNotificationArray) {
        _registerNotificationArray = [[NSMutableArray alloc]init];
    }
    return _registerNotificationArray;
}

//- (KSYVodPlayControl*)controlView {
//    if (!_controlView) {
//
//    }
//    return _controlView;
//}

#pragma mark -
#pragma mark - UITableViewDelegate

#pragma mark -
#pragma mark - CustomDelegate 自定义的代理

#pragma mark -
#pragma mark - event response 所有触发的事件响应 按钮、通知、分段控件等

#pragma mark -
#pragma mark - life cycle 视图的生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.allowRotation = YES;
    
    //self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    //self.navigationController.navigationBarHidden = NO;
}

#pragma mark -
#pragma mark - StatisticsLog 各种页面统计Log
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
