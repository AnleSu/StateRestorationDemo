//
//  ViewControllerA.m
//  StateRestorationDemo
//
//  Created by 宿安乐 on 2019/8/14.
//  Copyright © 2019 宿安乐. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()<UIViewControllerRestoration>

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.restorationIdentifier = @"restorationIdentifierA";
    self.restorationClass = self.class;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) encodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"ViewControllerA ---- encodeRestorableStateWithCoder");
    [super encodeRestorableStateWithCoder:coder];
}
- (void) decodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"ViewControllerA ---- decodeRestorableStateWithCoder");
    [super decodeRestorableStateWithCoder:coder];
}

- (void) applicationFinishedRestoringState {
    NSLog(@"ViewControllerA ---- applicationFinishedRestoringState");
}

+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    
    
    ViewControllerA *vc = [[ViewControllerA alloc]init];
    vc.restorationIdentifier = identifierComponents.lastObject;
    vc.restorationClass = [self class];
    return vc;
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
