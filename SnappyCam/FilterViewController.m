//
//  FilterViewController.m
//  SnappyCam
//
//  Created by Gaurav Menghani on 12/31/14.
//  Copyright (c) 2014 Gaurav Menghani. All rights reserved.
//

#import "FilterViewController.h"
#import "GPUImage.h"

@interface FilterViewController ()
@property (strong, nonatomic) UIImage* chosenImg;
@property (strong, nonatomic) IBOutlet UIImageView *chosenImgView;
- (IBAction)firstFilter:(id)sender;
- (IBAction)secondFilter:(id)sender;

@end

@implementation FilterViewController

- (id)initWithChosenImage:(UIImage *)img {
    self.chosenImg = img;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chosenImgView.image = self.chosenImg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)firstFilter:(id)sender {
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:self.chosenImg];
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    
    [stillImageSource addTarget:stillImageFilter];
    [stillImageFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    self.chosenImgView.image = [stillImageFilter imageFromCurrentFramebuffer];
}

- (IBAction)secondFilter:(id)sender {
}
@end
