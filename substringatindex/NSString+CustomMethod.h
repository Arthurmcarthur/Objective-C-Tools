//
//  NSString+CustomMethod.h
//  category3
//
//  Created by Qwetional on 27/6/2019.
//  Copyright © 2019 Qwetional. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CustomMethod)
- (NSUInteger)trueLengthOfString;
+ (NSUInteger)trueLengthOfString:(NSString*)targetString;
- (NSString*)substringAtIndex:(NSUInteger)index;
+ (NSString*)substringAtIndex:(NSUInteger)index withString:(NSString*)targetString;
@end

NS_ASSUME_NONNULL_END
