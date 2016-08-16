//
//  RoomDetails+CoreDataProperties.h
//  FinalProject
//
//  Created by JOSE PILAPIL on 2016-08-16.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RoomDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoomDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *label;
@property (nullable, nonatomic, retain) NSString *partDescription;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *images;
@property (nullable, nonatomic, retain) Room *room;

@end

@interface RoomDetails (CoreDataGeneratedAccessors)

- (void)addImagesObject:(NSManagedObject *)value;
- (void)removeImagesObject:(NSManagedObject *)value;
- (void)addImages:(NSSet<NSManagedObject *> *)values;
- (void)removeImages:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
