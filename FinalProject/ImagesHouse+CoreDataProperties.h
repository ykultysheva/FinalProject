//
//  ImagesHouse+CoreDataProperties.h
//  FinalProject
//
//  Created by Yana Kultysheva on 2016-08-08.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ImagesHouse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImagesHouse (CoreDataProperties)

@property (nullable, nonatomic, retain) House *house;

@end

NS_ASSUME_NONNULL_END
