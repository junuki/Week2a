//
//  StatusViewController.m
//  Week2a
//
//  Created by Jung Eun Kim on 6/29/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()
@property (weak, nonatomic) IBOutlet UITextField *commentTxt;

@end

@implementation StatusViewController

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
    
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:(88.0/255.0) green:(144.0/255.0) blue:(255.0/255.0) alpha:1];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(247.0/255.0) green:(248.0/255.0) blue:(249.0/255.0) alpha:1];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor blackColor],NSForegroundColorAttributeName,
                                    [UIColor blackColor],NSBackgroundColorAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.title = @"Update Status";


    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.leftBarButtonItem = doneButton;
    
    [_commentTxt becomeFirstResponder];
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)statusEditing:(id)sender {
}
@end
