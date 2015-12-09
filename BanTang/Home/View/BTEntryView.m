//
//  BTEntryView.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTEntry.h"
#import "BTEntryView.h"


@interface BTEntryView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation BTEntryView

- (UIScrollView *)scrollView{
    
    if(!_scrollView){
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        CGFloat width = _height==0?(screenW - ((int)round(_rowCount)*_spaceWidth))/ _rowCount:screenW;
        
        CGFloat height = _height==0?(screenW - ((int)round(_rowCount)*_spaceWidth))/ _rowCount:_height;
        
        CGFloat x = _spaceWidth ;
        
        for (NSInteger i = 0; i<_entryArray.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, _spaceWidth,width, height)];

            [imageView sd_setImageWithURL:[NSURL URLWithString:_entryArray[i]]];
            
            [_scrollView setContentSize:CGSizeMake(CGRectGetMaxX(imageView.frame)+_spaceWidth, height+_spaceWidth)];
            
            [_scrollView addSubview:imageView];
            
            _scrollView.showsVerticalScrollIndicator = NO;
            
            _scrollView.showsHorizontalScrollIndicator = NO;
            
            x += width+_spaceWidth;
            
        }
        
        [self addSubview:_scrollView];
        
        if (_isPage) {
            
            _scrollView.delegate = self;
            
            self.pageControl.numberOfPages = _entryArray.count;
            
        }
        
    }
    
    return _scrollView;
}

- (void)setEntryArray:(NSMutableArray *)entryArray{
    
    _entryArray = entryArray;
    
    self.scrollView.pagingEnabled = _isPage;

}

- (UIPageControl *)pageControl{
    
    if(!_pageControl){
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _height -20, screenW, 20)];
        
        [self addSubview:_pageControl];
        
    }
    
    return _pageControl;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x/screenW;
    
    
    _pageControl.currentPage = (scrollView.contentOffset.x/screenW > _entryArray.count-1)  ? 0 : page;
    
    _scrollView.contentOffset= (scrollView.contentOffset.x/screenW > _entryArray.count-1)  ? CGPointMake(0, 0):_scrollView.contentOffset;
}

@end
