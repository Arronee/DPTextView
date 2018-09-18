//
//  DPTextView.h
//  DPTextView
//
//  Created by roc on 2018/9/18.
//  Copyright © 2018年 roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPTextView : UITextView

@property (copy, nonatomic, nullable) IBInspectable NSString *placeholder;

@property (strong, nonatomic, nullable) IBInspectable UIColor *placeholderColor;

@property (strong, nonatomic, nullable) UIFont *placeholderFont;

@property(nonatomic,assign)NSInteger maxLength;//字体的最大长度

@end
