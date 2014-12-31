//
//  MenuViewController.m
//  SnappyCam
//
//  Created by Gaurav Menghani on 12/31/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "MenuViewController.h"
#import "FilterViewController.h"

@interface MenuViewController ()
- (IBAction)takePhoto:(id)sender;
- (IBAction)pickFromGallery:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *chosenImage;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"Finished picking the image");
    UIImage* img = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.chosenImage setImage:img];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    FilterViewController *fvc = [[FilterViewController alloc] initWithChosenImage:img];
    [self.navigationController pushViewController:fvc
                                         animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
    imagePicker.delegate = self;
}

- (IBAction)pickFromGallery:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
    imagePicker.delegate = self;
}
@end
