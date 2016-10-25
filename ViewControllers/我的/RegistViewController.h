//
//  RegistViewController.h
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolsX.h" 
#import "AFNetworking.h"
@interface RegistViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *checkNumTF;
@property (weak, nonatomic) IBOutlet UIButton *getCNButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (nonatomic , assign) NSInteger transferdTag ;
@end
