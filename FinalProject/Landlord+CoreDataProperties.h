//
//  Landlord+CoreDataProperties.h
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Landlord.h"

NS_ASSUME_NONNULL_BEGIN

@interface Landlord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<House *> *houses;

@end

@interface Landlord (CoreDataGeneratedAccessors)

- (void)addHousesObject:(House *)value;
- (void)removeHousesObject:(House *)value;
- (void)addHouses:(NSSet<House *> *)values;
- (void)removeHouses:(NSSet<House *> *)values;

@end

NS_ASSUME_NONNULL_END
