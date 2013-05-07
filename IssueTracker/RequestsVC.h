//
//  RequestsVC.h
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestsVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pathField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)goButtonPressed;

@end
