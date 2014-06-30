//
//  MoreViewController.m
//  Week2a
//
//  Created by Jung Eun Kim on 6/29/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
- (IBAction)showActionSheet:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation MoreViewController

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
    
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    
    
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(63.0/255.0) green:(87.0/255.0) blue:(156.0/255.0) alpha:1];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.title = @"More";
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"button_search_wht"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"button_message_wht"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.rightBarButtonItem = rightButton;
   
}

- (void)doNothing;
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showActionSheet:(id)sender {
   
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log out" otherButtonTitles:nil, nil];
    
    [actionSheet showInView:self.view];
    
}
@end










