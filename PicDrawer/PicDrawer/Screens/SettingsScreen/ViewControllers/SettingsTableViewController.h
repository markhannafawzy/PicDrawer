//
//  SettingsTableViewController.h
//  PicDrawer
//
//  Created by Mark on 7/10/18.
//  Copyright © 2018 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SettingsViewControllerDelegate <NSObject>
- (void)closeSettings:(id)sender;
@end
@interface SettingsTableViewController : UITableViewController
- (IBAction)closeSettings:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *brushControl;
@property (weak, nonatomic) IBOutlet UISlider *opacityControl;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;
@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;
@property (nonatomic, weak) id<SettingsViewControllerDelegate> delegate;
- (IBAction)sliderChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *redControl;
@property (weak, nonatomic) IBOutlet UISlider *greenControl;
@property (weak, nonatomic) IBOutlet UISlider *blueControl;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property CGFloat brush;
@property CGFloat opacity;
@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;
@end
