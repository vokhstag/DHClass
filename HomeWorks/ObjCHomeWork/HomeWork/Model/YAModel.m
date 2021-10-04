//
//  YAModel.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "YAModel.h"

@implementation YAModel

NSDictionary<NSString *, NSString *> *cars;
NSDictionary<NSString *, NSString *> *bicycles;

- (id)init {
    self = [super init];
    if (self) {
        self.cars = @{
            @"Audi" : @"Описание марки автомобиля",
            @"BMW" : @"Описание марки автомобиля",
            @"Hyundai" : @"Описание марки автомобиля",
            @"Mazda" : @"Описание марки автомобиля",
            @"Mercedes-benz" : @"Описание марки автомобиля"
        };
        
        self.bicycles = @{
            @"Cube": @"Описание марки Велосипеда",
            @"Cannondale": @"Описание марки Велосипеда",
            @"Centurion": @"Описание марки Велосипеда",
            @"Electra": @"Описание марки Велосипеда",
            @"Fuji": @"Описание марки Велосипеда"
        };
    }

    return self;
}

@end
