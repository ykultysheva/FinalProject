//
//  ImagesRoomDetails+CoreDataProperties.h
//  FinalProject
//
//  Created by JOSE PILAPIL on 2016-08-16.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ImagesRoomDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImagesRoomDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) RoomDetails *roomDetail;

@end

NS_ASSUME_NONNULL_END
