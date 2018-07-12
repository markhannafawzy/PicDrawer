//
//  DrawingScreenModel.h
//  PicDrawer
//
//  Created by Mark on 7/12/18.
//  Copyright © 2018 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DrawingScreenModel : NSObject
@property (strong, nonatomic) NSMutableArray * sectionStrings;
@property (strong, nonatomic) NSMutableArray * returnedImages;
//@property (strong, nonatomic) DrawingScreenModel * drawingScreenModel;
-(void) saveImageInCoreData: (NSData *)imageData;
-(void)getDistinctDatesStrings;
-(void)getSectionImages:(int)section;
@end
