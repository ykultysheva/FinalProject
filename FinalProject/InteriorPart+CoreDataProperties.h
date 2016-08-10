//
//  InteriorPart+CoreDataProperties.h
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "InteriorPart.h"

NS_ASSUME_NONNULL_BEGIN

@interface InteriorPart (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *descriptionBefore;
@property (nullable, nonatomic, retain) NSString *descriptionAfter;
@property (nullable, nonatomic, retain) Room *room;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *images;

@end

@interface InteriorPart (CoreDataGeneratedAccessors)

- (void)addImagesObject:(NSManagedObject *)value;
- (void)removeImagesObject:(NSManagedObject *)value;
- (void)addImages:(NSSet<NSManagedObject *> *)values;
- (void)removeImages:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
