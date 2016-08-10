//
//  House+CoreDataProperties.h
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "House.h"

NS_ASSUME_NONNULL_BEGIN

@interface House (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *descriptionHouse;
@property (nullable, nonatomic, retain) NSManagedObject *landlord;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *rooms;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *images;

@end

@interface House (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(NSManagedObject *)value;
- (void)removeRoomsObject:(NSManagedObject *)value;
- (void)addRooms:(NSSet<NSManagedObject *> *)values;
- (void)removeRooms:(NSSet<NSManagedObject *> *)values;

- (void)addImagesObject:(NSManagedObject *)value;
- (void)removeImagesObject:(NSManagedObject *)value;
- (void)addImages:(NSSet<NSManagedObject *> *)values;
- (void)removeImages:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
