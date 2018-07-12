//
//  DrawingScreenModel.m
//  PicDrawer
//
//  Created by Mark on 7/12/18.
//  Copyright © 2018 Mark. All rights reserved.
//

#import "DrawingScreenModel.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@implementation DrawingScreenModel
- (NSMutableArray *)sectionStrings{
    _sectionStrings = [NSMutableArray new];
    return _sectionStrings;
}
-(NSMutableArray *)returnedImages{
    _returnedImages = [NSMutableArray new];
    return _returnedImages;
}
-(void)getDistinctDatesStrings{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate persistentContainer].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Images" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchRequest.resultType = NSDictionaryResultType;
    fetchRequest.propertiesToFetch = [NSArray arrayWithObject:[[entity propertiesByName] objectForKey:@"imageDate"]];
    fetchRequest.returnsDistinctResults = YES;
    NSError *error = nil;
    NSArray  *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"no object");
    }
    for(NSManagedObject* currentObj in fetchedObjects) {
        
        NSDate* imgDate = [currentObj valueForKey:@"imageDate"];
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:imgDate];
        [self.sectionStrings addObject:dateString];
    }
}

-(void) saveImageInCoreData: (NSData *)imageData {
//    [self getDistinctDatesStrings];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate persistentContainer].viewContext;
    NSManagedObject *newImage = [NSEntityDescription insertNewObjectForEntityForName:@"Images" inManagedObjectContext:managedObjectContext];
    
    [newImage setValue:imageData forKey:@"image"];
    NSDate *currentDate = [NSDate date];
    [newImage setValue:currentDate forKey:@"imageDate"];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
//    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
//    NSString *dateString = [dateFormatter stringFromDate:currentDate];
//
//    //NSSet *stringsForSections = [NSSet setWithArray:_sectionStrings];
//    if (![self.sectionStrings containsObject:dateString]) {
//        [self.sectionStrings addObject:dateString];
//    }
}

-(void)getSectionImages:(int)section{
    [self getDistinctDatesStrings];
//    NSMutableArray * returnedImages = [NSMutableArray new];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate persistentContainer].viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Images" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray  *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"no object");
    }
    else
    {
        for(NSManagedObject* currentObj in fetchedObjects) {
            
            NSData* imgData = [currentObj valueForKey:@"image"];

            NSDate* imgDate = [currentObj valueForKey:@"imageDate"];
            NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy"];
            NSString *dateString = [dateFormatter stringFromDate:imgDate];
            
            if (dateString == self.sectionStrings[section]) {
                [self.returnedImages addObject:imgData];
            }
        }
        
    }
}
@end
