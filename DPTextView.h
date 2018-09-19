//
//  DPTextView.h
//  DPTextView
//
//  Created by roc on 2018/9/18.
//  Copyright © 2018年 roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPTextView : UITextView

@property (copy, nonatomic, nullable) IBInspectable NSString *placeholder;//占位符

@property (strong, nonatomic, nullable) IBInspectable UIColor *placeholderColor;//占位符的颜色

@property (strong, nonatomic, nullable) UIFont *placeholderFont;//占位符的字体大小

@property(nonatomic,assign)NSInteger maxLength;//输入框的最大限制字数

@end
