//
//  DPTextView.m
//  DPTextView
//
//  Created by roc on 2018/9/18.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "DPTextView.h"

@interface DPTextView()

@property (strong, nonatomic) UILabel *placeholderLabel;

@property(nonatomic,strong)UILabel *numLabel;

@end

@implementation DPTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    [self addSubview:self.placeholderLabel];
    [self addSubview:self.numLabel];
    
    self.placeholderColor = [UIColor lightGrayColor];
    self.placeholderFont = [UIFont systemFontOfSize:16.0f];
    self.font = [UIFont systemFontOfSize:16.0f];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}
#pragma mark - UITextViewTextDidChangeNotification
- (void)textDidChange {
    self.placeholderLabel.hidden = self.hasText;
    if (!self.markedTextRange) {
        if (self.text.length>self.maxLength) {
            NSString *tem = [self.text substringToIndex:self.maxLength];
            self.text = tem;
        }
        self.numLabel.text = [NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.text.length,(long)self.maxLength];
    }
}
#pragma mark -- setter
- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}
- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}
-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    self.placeholderLabel.font = placeholderFont;
    [self setNeedsLayout];
}
- (void)setMaxLength:(NSInteger)maxLength{
    _maxLength = maxLength;
    self.numLabel.text = [NSString stringWithFormat:@"%@/%ld",@"0",(long)self.maxLength];
}
#pragma mark -- getter
-(UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc]init];
        _placeholderLabel.backgroundColor = [UIColor clearColor];
    }
    return _placeholderLabel;
}
-(UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]init];
        _numLabel.textColor = [UIColor blackColor];
        _numLabel.font = [UIFont systemFontOfSize:14.0];
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.backgroundColor = [UIColor yellowColor];
    }
    return _numLabel;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.placeholderLabel.frame;
    frame.origin.y = self.textContainerInset.top;
    frame.origin.x = self.textContainerInset.left+6.0f;
    frame.size.width = self.frame.size.width - self.textContainerInset.left*2.0;
    
    CGSize maxSize = CGSizeMake(frame.size.width, MAXFLOAT);
    frame.size.height = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
    self.placeholderLabel.frame = frame;
    
    CGFloat numLabelY = 0;
    numLabelY = self.frame.size.height+self.contentOffset.y-20;
    self.numLabel.frame = CGRectMake(self.frame.size.width-60, numLabelY, 60, 20);
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:UITextViewTextDidChangeNotification];
}
@end
