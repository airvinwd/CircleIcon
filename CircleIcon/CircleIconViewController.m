//
//  CircleIconViewController.m
//  CircleIcon
//
//  Created by 吴迪 on 2017/3/11.
//  Copyright © 2017年 吴迪. All rights reserved.
//

#import "CircleIconViewController.h"
#import "CircleView.h"
@interface CircleIconViewController ()

@end

@implementation CircleIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    UIView *fillView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 20, 20)];
    
    CircleIcon *circleFillIcon = [CircleIcon instanceCircleIconWithFillColor:[UIColor blueColor] fillType:SIIconCross];
    CircleIcon *circleBorderIcon = [CircleIcon instanceCircleIconWithBorderColor:[UIColor purpleColor]];
    [fillView addSubview:circleFillIcon];
    [borderView addSubview:circleBorderIcon];
    [self.view addSubview:fillView];
    [self.view addSubview:borderView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
