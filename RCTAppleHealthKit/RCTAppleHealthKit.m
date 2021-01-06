//
//  RCTAppleHealthKit.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit.h"
#import "RCTAppleHealthKit+TypesAndPermissions.h"

#import "RCTAppleHealthKit+Methods_Activity.h"
#import "RCTAppleHealthKit+Methods_Body.h"
#import "RCTAppleHealthKit+Methods_Fitness.h"
#import "RCTAppleHealthKit+Methods_Dietary.h"
#import "RCTAppleHealthKit+Methods_Characteristic.h"
#import "RCTAppleHealthKit+Methods_Vitals.h"
#import "RCTAppleHealthKit+Methods_Results.h"
#import "RCTAppleHealthKit+Methods_Sleep.h"
#import "RCTAppleHealthKit+Methods_Mindfulness.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>

@implementation RCTAppleHealthKit

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTResponseSenderBlock)callback)
{
    [self isHealthKitAvailable:callback];
}

RCT_EXPORT_METHOD(openSettings)
{
    [self openHealthKitSettings];
}

RCT_EXPORT_METHOD(reportMeal:(NSDictionary *)input resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self reportHealthKitMeal:input resolver:resolve rejecter:reject];
}

RCT_EXPORT_METHOD(deleteMeal:(NSString *)mealId resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self deleteHealthKitMeal:mealId resolver:resolve rejecter:reject];
}

RCT_EXPORT_METHOD(authStatus:(NSArray *)permissionNames resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self authorizationStatus:permissionNames resolver:resolve rejecter:reject];
}

RCT_EXPORT_METHOD(initHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self initializeHealthKit:input callback:callback];
}

RCT_EXPORT_METHOD(initStepCountObserver:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_initializeStepEventObserver:input callback:callback];
}

RCT_EXPORT_METHOD(getBiologicalSex:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getBiologicalSex:input callback:callback];
}

RCT_EXPORT_METHOD(getDateOfBirth:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getDateOfBirth:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestWeight:input callback:callback];
}

RCT_EXPORT_METHOD(getWeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getWeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveWeight:input callback:callback];
}

RCT_EXPORT_METHOD(deleteWeight:(NSString *)input resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self body_deleteWeight:input resolver:resolve rejecter:reject];
}

RCT_EXPORT_METHOD(getLatestHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getHeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getHeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(saveBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBodyFatPercentage:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyFatPercentage:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestLeanBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestLeanBodyMass:input callback:callback];
}

RCT_EXPORT_METHOD(getStepCount:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getStepCountOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getSamples:input callback:callback];
}

RCT_EXPORT_METHOD(setObserver:(NSDictionary *)input)
{
    [self fitness_setObserver:input];
}


RCT_EXPORT_METHOD(getDailyStepCountSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyStepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveSteps:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_saveSteps:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceWalkingRunning:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceWalkingRunningOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceWalkingRunningSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceWalkingRunningSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceCycling:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceCyclingOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceCyclingSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceCyclingSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getFlightsClimbed:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getFlightsClimbedOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyFlightsClimbedSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyFlightsClimbedSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveFood:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveFood:input callback:callback];
}

RCT_EXPORT_METHOD(saveWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveWater:input callback:callback];
}

RCT_EXPORT_METHOD(getHeartRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getHeartRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getActiveEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
   [self activity_getActiveEnergyBurned:input callback:callback];
}
    
RCT_EXPORT_METHOD(saveWorkout:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self activity_saveWorkout:input callback: callback];
}

RCT_EXPORT_METHOD(getBasalEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self activity_getBasalEnergyBurned:input callback:callback];
}

RCT_EXPORT_METHOD(getBodyTemperatureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBodyTemperatureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodPressureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBloodPressureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getRespiratoryRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getRespiratoryRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodGlucoseSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self results_getBloodGlucoseSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self sleep_getSleepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self getModuleInfo:input callback:callback];
}

RCT_EXPORT_METHOD(saveMindfulSession:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self mindfulness_saveMindfulSession:input callback:callback];
}


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.healthStore = [[HKHealthStore alloc] init];
    }
    
    return self;
}

- (void)isHealthKitAvailable:(RCTResponseSenderBlock)callback
{
    BOOL isAvailable = NO;
    if ([HKHealthStore isHealthDataAvailable]) {
        isAvailable = YES;
    }
    callback(@[[NSNull null], @(isAvailable)]);
}

- (void)authorizationStatus:(NSArray *)permissionNames resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    if ([permissionNames count] == 0) {
        reject(@"no_permission_provided", @"[HealthKit][authorizationStatus] please provide permission names", [NSNull null]);
    }
    
    NSSet *permissionObjects = [self getWritePermsFromOptions: permissionNames];
    
    NSMutableArray *authStatuses = [[NSMutableArray alloc] init];
    for(HKObjectType *permission in permissionObjects) {
        [authStatuses addObject:@([self.healthStore authorizationStatusForType:permission])];
    }
    
    if([authStatuses containsObject:@(HKAuthorizationStatusSharingDenied)]) {
        resolve(@"DENIED");
    } else if ([authStatuses containsObject:@(HKAuthorizationStatusNotDetermined)]) {
        resolve(@"UNKNOWN");
    } else {
        resolve(@"AUTHORIZED");
    }
}

- (void)initializeHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    if ([HKHealthStore isHealthDataAvailable]) {
        NSSet *writeDataTypes;
        NSSet *readDataTypes;

        // get permissions from input object provided by JS options argument
        NSDictionary* permissions =[input objectForKey:@"permissions"];
        if(permissions != nil){
            NSArray* readPermsArray = [permissions objectForKey:@"read"];
            NSArray* writePermsArray = [permissions objectForKey:@"write"];
            NSSet* readPerms = [self getReadPermsFromOptions:readPermsArray];
            NSSet* writePerms = [self getWritePermsFromOptions:writePermsArray];

            if(readPerms != nil) {
                readDataTypes = readPerms;
            }
            if(writePerms != nil) {
                writeDataTypes = writePerms;
            }
        } else {
            callback(@[RCTMakeError(@"permissions must be provided in the initialization options", nil, nil)]);
            return;
        }

        // make sure at least 1 read or write permission is provided
        if(!writeDataTypes && !readDataTypes){
            callback(@[RCTMakeError(@"at least 1 read or write permission must be set in options.permissions", nil, nil)]);
            return;
        }

        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success) {
                NSString *errMsg = [NSString stringWithFormat:@"Error with HealthKit authorization: %@", error];
                NSLog(errMsg);
                callback(@[RCTMakeError(errMsg, nil, nil)]);
                return;
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    callback(@[[NSNull null], @true]);
                });
            }
        }];
    } else {
        callback(@[RCTMakeError(@"HealthKit data is not available", nil, nil)]);
    }
}

- (void)openHealthKitSettings {
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSURL *privacySettingsUrl = [NSURL URLWithString:@"App-Prefs:"];
        // Note: On iOS 11 this will just open the settings app without navigating to Privacy.
        // https://stackoverflow.com/questions/46253781/ios-11-url-scheme-for-specific-settings-section-stopped-working
        [[UIApplication sharedApplication] openURL:privacySettingsUrl];
    });
}

- (void)getModuleInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDictionary *info = @{
            @"name" : @"react-native-apple-healthkit",
            @"description" : @"A React Native bridge module for interacting with Apple HealthKit data",
            @"className" : @"RCTAppleHealthKit",
            @"author": @"Greg Wilson",
    };
    callback(@[[NSNull null], info]);
}

#pragma mark Meals
-(void)reportHealthKitMeal:(NSDictionary *)input resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    NSString *id = [input objectForKey:@"id"];
    NSString *name = [input objectForKey:@"name"];
    NSString *type = [input objectForKey:@"type"];
    NSDictionary *macros = [input objectForKey:@"macros"];
    
    if (!id || !name || !type || !macros) {
        reject(@"healthkit_error", @"invalid data provided", nil);
    }
    
    NSString *dateTimeString = [input objectForKey:@"dateTime"];
    int energy = [[input valueForKey:@"energy"] integerValue];
    int fat = [[macros valueForKey:@"fat"] integerValue];
    int fiber = [[macros valueForKey:@"fiber"] integerValue];
    int sugar = [[macros valueForKey:@"sugar"] integerValue];
    int carbs = [[macros valueForKey:@"carbs"] integerValue];
    int protein = [[macros valueForKey:@"protein"] integerValue];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS";
    NSDate *mealDate = [dateFormatter dateFromString:dateTimeString];
    NSDictionary *metadata = @{
                               @"mealId": id,
                               @"recipe" : name,
                               @"type": type
                               };
    HKQuantitySample *fatSample = [self createMealSample:fat unit:[HKUnit gramUnit] typeIdentifier:HKQuantityTypeIdentifierDietaryFatTotal mealDate:mealDate meatadata:metadata];
    HKQuantitySample *fiberSample = [self createMealSample:fiber unit:[HKUnit gramUnit] typeIdentifier:HKQuantityTypeIdentifierDietaryFiber mealDate:mealDate meatadata:metadata];
    HKQuantitySample *sugarSample = [self createMealSample:sugar unit:[HKUnit gramUnit] typeIdentifier:HKQuantityTypeIdentifierDietarySugar mealDate:mealDate meatadata:metadata];
    HKQuantitySample *carbsSample = [self createMealSample:carbs unit:[HKUnit gramUnit] typeIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates mealDate:mealDate meatadata:metadata];
    HKQuantitySample *proteinSample = [self createMealSample:protein unit:[HKUnit gramUnit] typeIdentifier:HKQuantityTypeIdentifierDietaryProtein mealDate:mealDate meatadata:metadata];
    HKQuantitySample *energySample = [self createMealSample:energy unit:[HKUnit kilocalorieUnit] typeIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed mealDate:mealDate meatadata:metadata];
    
    NSArray<HKQuantitySample *> *mealSamples = @[fatSample, fiberSample, sugarSample, carbsSample, proteinSample, energySample];
    
    if ([mealSamples count] == 0) {
        reject(@"healthkit_error", @"no meal samples provided", nil);
    }
    
    [self.healthStore saveObjects:mealSamples withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            resolve(nil);
        } else {
            reject(@"healthkit_error", @"failed to save", error);
        }
    }];
}

- (HKQuantitySample *)createMealSample:(int )quantity unit:(HKUnit *)unit typeIdentifier:(HKQuantityTypeIdentifier )typeIdentifier mealDate:(NSDate *)mealDate meatadata:(NSDictionary *)metadata
{
    HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:typeIdentifier];
    HKQuantity *hkQuantity = [HKQuantity quantityWithUnit:unit doubleValue:quantity];
    HKQuantitySample *mealSample = [HKQuantitySample quantitySampleWithType:type quantity:hkQuantity startDate:mealDate endDate:mealDate metadata:metadata];
    
    return mealSample;
}

-(void)deleteHealthKitMeal:(NSString *)mealId resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    NSArray<HKQuantityTypeIdentifier> *identifiers = @[
                                                       HKQuantityTypeIdentifierDietarySugar,
                                                       HKQuantityTypeIdentifierDietaryProtein,
                                                       HKQuantityTypeIdentifierDietaryFatTotal,
                                                       HKQuantityTypeIdentifierDietaryCarbohydrates,
                                                       HKQuantityTypeIdentifierDietaryFiber,
                                                       HKQuantityTypeIdentifierDietaryEnergyConsumed
                                                       ];
    
    __block NSError *failure;
    for (HKQuantityTypeIdentifier identifier in identifiers) {
        HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:identifier];
        NSPredicate *predicate = [HKQuery predicateForObjectsWithMetadataKey:@"mealId" allowedValues:@[mealId]];
        HKSampleQuery *query = [[HKSampleQuery alloc] initWithSampleType:type predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
            if (error) {
                failure = error;
            }
            
            if (results) {
                [self.healthStore deleteObjects:results withCompletion:^(BOOL success, NSError * _Nullable error) {
                    if (error) {
                        failure = error;
                    }
                }];
            }
        }];
        
        [self.healthStore executeQuery:query];
    }
    
    if (failure) {
        reject(@"healthkit_error", @"failed to delete meal data", failure);
    } else {
        resolve(nil);
    }
}

@end
