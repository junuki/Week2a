//
//  LoginViewController.m
//  Week2a
//
//  Created by Jung Eun Kim on 6/28/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "PeopleViewController.h"
#import "NotificationViewController.h"
#import "StatusViewController.h"
#import "MoreViewController.h"
#import "CheckinViewController.h"
#import "ProfileViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *loginContainerView;

- (IBAction)onTap:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)onLoginEditingBegin:(id)sender;
- (IBAction)onEditingChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *signupLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)onLogin:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *emptyLabel;


@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
      // Do any additional setup after loading the view from its nib.
    self.loginButton.alpha = .7;
    [self.loginButton setEnabled: NO];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogin:(id)sender {
    
    [self.view endEditing:YES];
    [self.loginActivityIndicator startAnimating];
    self.loginButton.enabled = NO;
    self.loginTextField.enabled = NO;
    self.passwordTextField.enabled = NO;
    
    self.containerView.alpha = .8;
    self.signupLabel.alpha = .4;
    
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:(UIControlStateDisabled)];
    
 //  [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateNormal];
    
    
   [UIView
   animateWithDuration:1
   delay:1
   options:UIViewAnimationOptionCurveLinear
   animations:^{
   self.emptyLabel.alpha=0;
   }
   
   completion:^(BOOL finished) {
         if ([self.passwordTextField.text isEqualToString:@"1234"])
             [self loginSuccess];
         else
             [self loginFail];
     }];
    
}



- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
}


- (void) loginSuccess {
    
   UIViewController *feedViewController = [[FeedViewController alloc] init];
   UIViewController *peopleViewController = [[PeopleViewController alloc] init];
   UIViewController *notificationViewController = [[NotificationViewController alloc] init];
   UIViewController *moreViewController = [[MoreViewController alloc] init];
   UIViewController *profileViewController = [[ProfileViewController alloc] init];
    
    
   UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
   UINavigationController *peopleNavigationController = [[UINavigationController alloc] initWithRootViewController:peopleViewController];
   UINavigationController *notificationNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationViewController];
   UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:moreViewController];
   UINavigationController *profileNavigationController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    
   // UINavigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
 
    feedNavigationController.tabBarItem.title = @"News Feed";
    feedNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_newsfeed"];
    feedNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    feedNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(63.0/255.0) green:(87.0/255.0) blue:(156.0/255.0) alpha:1];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    feedNavigationController.navigationBar.titleTextAttributes = textAttributes;
    feedNavigationController.navigationBar.topItem.title = @"News Feed";
                                                               
    peopleNavigationController.tabBarItem.title = @"Request";
    peopleNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_people"];
    peopleNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    peopleNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(63.0/255.0) green:(87.0/255.0) blue:(156.0/255.0) alpha:1];
    peopleNavigationController.navigationBar.topItem.title = @"Requests";
    
    
    notificationNavigationController.tabBarItem.title = @"Notifications";
    notificationNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_notifications"];
    
    moreNavigationController.tabBarItem.title = @"More";
    moreNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_more"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNavigationController, peopleNavigationController, notificationNavigationController, moreNavigationController];
      tabBarController.tabBar.translucent = NO;
    
    [self presentViewController:tabBarController animated:YES completion:nil];

}
    


- (void) loginFail {
   // [self shakeLogin];
    [self.loginActivityIndicator stopAnimating];
    self.loginButton.enabled = YES;
    self.loginTextField.enabled = YES;
    self.passwordTextField.enabled = YES;
    self.signupLabel.alpha=1;
    self.emptyLabel.alpha=1;
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_button_disabled"] forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_button_disabled"] forState:UIControlStateNormal];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Password didn't match" message:@"Uh oh...please make sure you typed your password correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    
}



- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
    delay:0.0
    options:(animationCurve << 16)
    animations:^{
         CGRect containerFrame = self.containerView.frame;
         containerFrame.origin.y -= 40;
         self.containerView.frame = containerFrame;
                         
         CGRect labelFrame = self.signupLabel.frame;
         labelFrame.origin.y -= 80;
         self.signupLabel.frame = labelFrame;
    }
    completion:nil
     ];
    
    NSLog(@"kEYBOARD HIT");
    
}


-(void)keyboardDidHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    //    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect containerFrame = self.containerView.frame;
                         containerFrame.origin.y += 40;
                         self.containerView.frame = containerFrame;
                         
                         CGRect labelFrame = self.signupLabel.frame;
                         labelFrame.origin.y += 80;
                         self.signupLabel.frame = labelFrame;
                     } completion:nil ];
    
}

- (IBAction)onEditingChanged:(id)sender {
    if ([self.loginTextField.text length] != 0 && [self.passwordTextField.text length] != 0 ) {
        [self.loginButton setEnabled:YES];
        self.loginButton.alpha = 1;
    }
    else {
        [self.loginButton setEnabled:NO];
        self.loginButton.alpha = .5;
    }

}





- (IBAction)onLoginEditingBegin:(id)sender {

// [UIView animateWithDuration:0.3 animations:^{self.loginContainerView.frame = CGRectMake (self.loginContainerView.frame.origin.x, 150, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
        
   
    
//}];


}





@end
