//
//  Room+CoreDataProperties.h
//  FinalProject
//
//  Created by JOSE PILAPIL on 2016-08-16.
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
@property (nullable, nonatomic, retain) NSSet<RoomDetails *> *roomDetails;

@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addRoomDetailsObject:(RoomDetails *)value;
- (void)removeRoomDetailsObject:(RoomDetails *)value;
- (void)addRoomDetails:(NSSet<RoomDetails *> *)values;
- (void)removeRoomDetails:(NSSet<RoomDetails *> *)values;

@end

NS_ASSUME_NONNULL_END
