//
//  BMBrowserImageViewController.m
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/31.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "BMBrowserImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


#define BASE_TAG 1000



#define pageSize 16

//获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define pageColor RGB(67, 199, 176)

/** 滚动宽度*/
#define ScrollWidth self.view.frame.size.width

/** 滚动高度*/
#define ScrollHeight self.view.frame.size.height


@interface BMBrowserImageViewController ()<UIScrollViewDelegate>
{
    __weak  UIImageView *_leftImageView,*_centerImageView,*_rightImageView;
    
    __weak  UIScrollView *_scrollView;
    
    __weak  UIPageControl *_PageControl;
    
    /** 当前显示的是第几个*/
    NSInteger _currentIndex;
    
    /** 图片个数*/
    NSInteger _MaxImageCount;
    
}
@end

@implementation BMBrowserImageViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)show
{
    /** 设置数量*/
    [self setMaxImageCount:self.images.count];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



-(void)setMaxImageCount:(NSInteger)MaxImageCount
{
    
    _currentIndex = self.index;
    
    _MaxImageCount = MaxImageCount;
    
    [self createScrollView];
    
    /** 复用imageView初始化*/
    [self initImageView];
    
    /** pageControl*/
    [self createPageControl];
    
    
    /** 初始化图片位置*/
    [self changeImageLeft:_MaxImageCount-1 center:_currentIndex right:1];
}


- (void)createScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    /** 复用，创建三个*/
    scrollView.contentSize = CGSizeMake(ScrollWidth * self.images.count, 0);
    
    /** 开始显示的是第一个  前一个是最后一个  后一个是第二张*/
    _currentIndex = 0;
    
    _scrollView = scrollView;
}

- (void)initImageView {
    if (self.images.count >=3) {
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,ScrollWidth, ScrollHeight)];
        UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScrollWidth, 0,ScrollWidth, ScrollHeight)];
        UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScrollWidth * 2, 0,ScrollWidth, ScrollHeight)];
        
        centerImageView.userInteractionEnabled = YES;
        [centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
        
        [_scrollView addSubview:leftImageView];
        [_scrollView addSubview:centerImageView];
        [_scrollView addSubview:rightImageView];
        
        _leftImageView = leftImageView;
        _centerImageView = centerImageView;
        _rightImageView = rightImageView;
        
    }
    
    else if (2 == self.images.count){
        UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,ScrollWidth, ScrollHeight)];
        centerImageView.userInteractionEnabled = YES;
        [centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
        
        UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScrollWidth, 0,ScrollWidth, ScrollHeight)];
        
        rightImageView.userInteractionEnabled = YES;
        [rightImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
        
        [_scrollView addSubview:centerImageView];
        [_scrollView addSubview:rightImageView];
        
        
        _centerImageView = centerImageView;
        _rightImageView = rightImageView;
        
    }
    else if (1 == self.images.count){
        UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,ScrollWidth, ScrollHeight)];
        
        centerImageView.userInteractionEnabled = YES;
        [centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
        
        [_scrollView addSubview:centerImageView];
        
        _centerImageView = centerImageView;
    }
    else{
        
    }
    
}

- (void)imageViewDidTap
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)createPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,ScrollHeight - pageSize,ScrollWidth, 8)];
    
    //设置页面指示器的颜色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    //设置当前页面指示器的颜色
    pageControl.currentPageIndicatorTintColor = pageColor;
    pageControl.numberOfPages = _MaxImageCount;
    pageControl.currentPage = _currentIndex;
    
    [self.view addSubview:pageControl];
    
    _PageControl = pageControl;
}

- (void)changeImageLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex
{
    
    //一张图
    if (self.images.count == 1 ) {
        if (self.isLocal) {
            UIImage * centerImage = self.images[centerIndex];
            if (centerImage) {
                _centerImageView.image = centerImage;
            }
        }
        else{
            NSURL * centerUrl = [NSURL URLWithString:self.images[centerIndex]];
            if (centerUrl) {
                [_centerImageView sd_setImageWithURL:centerUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
        }
        [_scrollView setContentOffset:CGPointMake(0, 0)];
    }
    
    
    //两张图
    
    if (self.images.count == 2 ) {
        if (self.isLocal) {
            UIImage * centerImage = self.images[centerIndex];
            UIImage * rightImage = self.images[rightIndex];
            if (centerImage) {
                _centerImageView.image = centerImage;
            }
            if(rightImage){
                _rightImageView.image = rightImage;
            }
        }
        else{
            NSURL * centerUrl = [NSURL URLWithString:self.images[centerIndex]];
            if (centerUrl) {
                [_centerImageView sd_setImageWithURL:centerUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
            NSURL * rightUrl = [NSURL URLWithString:self.images[rightIndex]];
            if (rightUrl) {
                [_rightImageView sd_setImageWithURL:rightUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
        }
        [_scrollView setContentOffset:CGPointMake(0, 0)];
    }
    
    //三张或者以上图
    if (self.images.count >= 3) {
        if (self.isLocal) {
            UIImage * leftImage = self.images[LeftIndex];
            UIImage * centerImage = self.images[centerIndex];
            UIImage * rightImage = self.images[rightIndex];
            if (leftImage) {
                _leftImageView.image = leftImage;
            }
            if (centerImage) {
                _centerImageView.image = centerImage;
            }
            if(rightImage){
                _rightImageView.image = rightImage;
            }
        }
        else{
            
            NSURL * leftUrl = [NSURL URLWithString:self.images[LeftIndex]];
            if (leftUrl) {
                [_leftImageView sd_setImageWithURL:leftUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
            
            NSURL * centerUrl = [NSURL URLWithString:self.images[centerIndex]];
            if (centerUrl) {
                [_centerImageView sd_setImageWithURL:centerUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
            NSURL * rightUrl = [NSURL URLWithString:self.images[rightIndex]];
            if (rightUrl) {
                [_rightImageView sd_setImageWithURL:rightUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                }];
            }
        }
        [_scrollView setContentOffset:CGPointMake(ScrollWidth, 0)];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.images.count == 1) {
        return;
    }
    
    else if (2 == self.images.count){
        //开始滚动，判断位置，然后替换复用的三张图
        [self twoImgschangeImageWithOffset:scrollView.contentOffset.x];
    }
    else if (3 <= self.images.count){
        
        //开始滚动，判断位置，然后替换复用的三张图
        [self changeImageWithOffset:scrollView.contentOffset.x];
    }
    else{
        
    }
}

- (void)changeImageWithOffset:(CGFloat)offsetX
{
    if (offsetX >= ScrollWidth * 2)
    {
        _currentIndex++;
        
        if (_currentIndex == _MaxImageCount-1)
        {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
            
        }else if (_currentIndex == _MaxImageCount)
        {
            
            _currentIndex = 0;
            
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
            
        }else
        {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        _PageControl.currentPage = _currentIndex;
        
    }
    
    if (offsetX <= 0)
    {
        _currentIndex--;
        
        if (_currentIndex == 0) {
            
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
            
        }else if (_currentIndex == -1) {
            
            _currentIndex = _MaxImageCount-1;
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
            
        }else {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        
        _PageControl.currentPage = _currentIndex;
    }
}
-(void)twoImgschangeImageWithOffset:(CGFloat)offsetX
{
    if (offsetX >= ScrollWidth) {
        _PageControl.currentPage = 1;
    }
    if (0 < offsetX && offsetX < ScrollWidth) {
        _PageControl.currentPage = 0;
    }
    
}

@end
