//
//  Inspection+CoreDataProperties.h
//  
//
//  Created by JOSE PILAPIL on 2016-08-15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Inspection.h"

NS_ASSUME_NONNULL_BEGIN

@interface Inspection (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Room *> *rooms;
@property (nullable, nonatomic, retain) House *house;

@end

@interface Inspection (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(Room *)value;
- (void)removeRoomsObject:(Room *)value;
- (void)addRooms:(NSSet<Room *> *)values;
- (void)removeRooms:(NSSet<Room *> *)values;

@end

NS_ASSUME_NONNULL_END
