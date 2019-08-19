//
//  ViewController.m
//  StateRestorationDemo
//
//  Created by 宿安乐 on 2019/8/13.
//  Copyright © 2019 宿安乐. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerA.h"
@interface ViewController () 
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *addressText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.restorationIdentifier = @"restorationIdentifierFirst";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UIViewController *vc = [[ViewControllerA alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) encodeRestorableStateWithCoder:(NSCoder *)coder {
    [coder encodeObject:_nameText.text forKey:@"nameTextKey"];
    [coder encodeObject:_addressText.text forKey:@"addressTextKey"];
    [super encodeRestorableStateWithCoder:coder];
}
- (void) decodeRestorableStateWithCoder:(NSCoder *)coder {
    _nameText.text = [coder decodeObjectForKey:@"nameTextKey"];
    _addressText.text = [coder decodeObjectForKey:@"addressTextKey"];
    [super decodeRestorableStateWithCoder:coder];
}

- (void) applicationFinishedRestoringState {
    
}
@end
