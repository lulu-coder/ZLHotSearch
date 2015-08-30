//
//  ZLHotSearchView.m
//  CategoryAndSearch
//
//  Created by 张璐 on 15/8/8.
//  Copyright (c) 2015年 zl_coder. All rights reserved.
//

#import "ZLHotSearchView.h"
#define margin 10
#define btnMargin 10
#define titleLabelH 40
#define btnHeight 35
@interface ZLHotSearchView ()

@property(nonatomic,weak)UILabel * titleLabel;
@property (nonatomic,strong) NSMutableArray * btnArray;

@end
@implementation ZLHotSearchView

-(NSMutableArray *)btnArray
{
    if (!_btnArray) {
        self.btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

-(void)setContentArray:(NSArray *)contentArray
{
    _contentArray = contentArray;
    
    [self setNeedsDisplay];
}

-(void)setTitle:(NSString *)title
{
    _title = [title copy];
    self.titleLabel.text = title;
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

-(void)setContentFont:(UIFont *)contentFont
{
    _contentFont = contentFont;
    [self setNeedsDisplay];
}

-(void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    [self setNeedsDisplay];
    
}

-(void)setContentBackgroundImage:(NSString *)contentBackgroundImage
{
    _contentBackgroundImage = [contentBackgroundImage copy];
    [self setNeedsDisplay];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel * titleLabel = [[UILabel alloc]init];
        
        titleLabel.text = self.title ? self.title : @"热搜:";
        
        titleLabel.font = self.titleFont ? self.titleFont : [UIFont systemFontOfSize:15];
        titleLabel.textColor = self.titleColor ? self.titleColor : [UIColor redColor];
        
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.btnArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.btnArray removeAllObjects];
    self.titleLabel.frame = CGRectMake(margin, margin, self.frame.size.width - margin, titleLabelH);
    CGFloat btnY = CGRectGetMaxY(self.titleLabel.frame) + (self.insets.top ? self.insets.top : btnMargin);
    CGFloat btnW,btnX = self.insets.left ? self.insets.left : btnMargin;
    CGFloat btnH = self.itemHeight ? self.itemHeight : btnHeight;
    for (int i = 0; i<self.contentArray.count; i++)
    {
        UIButton * btn = [[UIButton alloc]init];
        //设置按钮背景图片
        [btn setBackgroundImage:[UIImage imageNamed:(self.contentBackgroundImage?self.contentBackgroundImage:nil)] forState:UIControlStateNormal];
        //设置按钮内容
        [btn setTitle:self.contentArray[i] forState:UIControlStateNormal];
        //设置按钮字体
        btn.titleLabel.font = self.contentFont ? self.contentFont : [UIFont systemFontOfSize:15];
        //设置按钮文字颜色
        [btn setTitleColor:self.contentColor ? self.contentColor : [UIColor blackColor] forState:UIControlStateNormal];
        //计算按钮文字长度
        CGSize size = [btn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, btnH) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size;
        
        btnW = size.width + (self.insets.left ? self.insets.left : btnMargin);
        if ((btnX + btnW + (self.insets.right?self.insets.right:btnMargin))>self.frame.size.width)
        {
            btnX = self.insets.left ? self.insets.left : btnMargin;
            btnY = btnY + btnH + (self.insets.bottom ? self.insets.bottom : btnMargin);
            
        }
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        //计算出下个按钮的X值
        btnX = btnX + btnW + (self.insets.right ? self.insets.right : btnMargin);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:btn];
        [self addSubview:btn];
    }

}
-(void)btnClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(hotSearchView:contentText:)]) {
        [self.delegate hotSearchView:self contentText:btn.titleLabel.text];
        
    }
}

@end
