//
//  DrawingScreenViewController+DrawingScreenViewController_TouchFunctions.h
//  PicDrawer
//
//  Created by Mark on 7/10/18.
//  Copyright © 2018 Mark. All rights reserved.
//

#import "DrawingScreenViewController.h"

@interface DrawingScreenViewController (DrawingScreenViewController_TouchFunctions)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
