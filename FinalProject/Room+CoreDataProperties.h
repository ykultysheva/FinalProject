//
//  Room+CoreDataProperties.h
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Room.h"

NS_ASSUME_NONNULL_BEGIN

@interface Room (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) House *house;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *interiorPart;

@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addInteriorPartObject:(NSManagedObject *)value;
- (void)removeInteriorPartObject:(NSManagedObject *)value;
- (void)addInteriorPart:(NSSet<NSManagedObject *> *)values;
- (void)removeInteriorPart:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
