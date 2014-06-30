//
//  FeedViewController.m
//  Week2a
//
//  Created by Jung Eun Kim on 6/28/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "FeedViewController.h"
#import "StatusViewController.h"
#import "CheckinViewController.h"
#import "ProfileViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedActivityIndicator;
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
- (IBAction)StatusButton:(id)sender;
- (IBAction)checkinButton:(id)sender;
- (IBAction)profileButton:(id)sender;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
              
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.alpha = 0;
    [self performSelector:@selector(showFeed) withObject:nil afterDelay:2];
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"button_search_wht"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"button_message_wht"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.rightBarButtonItem = rightButton;
   
    
    // Do any additional setup after loading the view from its nib.
}

- (void)doNothing{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showFeed
{
    self.scrollView.alpha = 1;
   [self.feedActivityIndicator stopAnimating];

}


- (IBAction)StatusButton:(id)sender {
    UIViewController *vc = [[StatusViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
   [self presentViewController:navigationController animated:YES completion:nil];
    
}

- (IBAction)checkinButton:(id)sender {
    CheckinViewController *vc = [[CheckinViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)profileButton:(id)sender {
    ProfileViewController *vc = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
