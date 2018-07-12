//
//  DrawingScreenViewController.h
//  PicDrawer
//
//  Created by Mark on 7/10/18.
//  Copyright © 2018 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingScreenModel.h"
#import "SettingsTableViewController.h"
@interface DrawingScreenViewController : UIViewController <SettingsViewControllerDelegate>{
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) DrawingScreenModel *drawingScreenModel;
- (IBAction)pencilPressed:(id)sender;
- (IBAction)eraserPressed:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)settings:(id)sender;
- (IBAction)reset:(id)sender;

@end
