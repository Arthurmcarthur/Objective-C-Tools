//
//  NSString+CustomMethod.m
//  category3
//
//  Created by Qwetional on 27/6/2019.
//  Copyright © 2019 Qwetional. All rights reserved.
//

#import "NSString+CustomMethod.h"

@implementation NSString (CustomMethod)
- (NSUInteger)trueLengthOfString{
    return [self lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
}
+ (NSUInteger)trueLengthOfString:(NSString*)targetString{
    return [targetString lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
}

- (NSString *)substringAtIndex:(NSUInteger)index{
    NSUInteger trueLengthValue = [self trueLengthOfString];         // 判断字符串含几个（人类通常认为的）字符
    NSUInteger codePointLengthValue = [self length];
    NSException* rangeException = [NSException exceptionWithName:@"Range Error" reason:@"Range or index out of bounds" userInfo:nil];
    if(index <= trueLengthValue){
        int substringStartCodePoint = 0;
        for (int trueLengthCounter = 0; trueLengthCounter < index;){
            unsigned short characterIntegerValue = [self characterAtIndex:substringStartCodePoint];
            if (0xD800 <= characterIntegerValue && 0xDBFF >= characterIntegerValue){
                unsigned short nextCharacterIntegerValue = [self characterAtIndex:(substringStartCodePoint + 1)];
                if (0xDC00 <= nextCharacterIntegerValue && 0xDFFF >= nextCharacterIntegerValue){
                    substringStartCodePoint += 2;
                    ++trueLengthCounter;
                }
                else{
                    ++substringStartCodePoint;
                    ++trueLengthCounter;
                }
            }
            else{
                ++substringStartCodePoint;
                ++trueLengthCounter;
            }
        }
        unsigned short characterIntegerValue = [self characterAtIndex:substringStartCodePoint];
        if (0xD800 <= characterIntegerValue && 0xDBFF >= characterIntegerValue){
            if (substringStartCodePoint < codePointLengthValue){
                unsigned short nextCharacterIntegerValue = [self characterAtIndex:(substringStartCodePoint + 1)];
                if (0xDC00 <= nextCharacterIntegerValue && 0xDFFF >= nextCharacterIntegerValue){
                    return [self substringWithRange:NSMakeRange(substringStartCodePoint, 2)];
                }
                else{
                    return [self substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
                }
            }
            else{
                return [self substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
            }
        }
        else if(0x0000 <= characterIntegerValue && 0x00FF >= characterIntegerValue){
            // resultCharArray[0] = (char)0x0000;
            return [self substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
        }
        else{
            return [self substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
        }
    }else{
        @throw rangeException;
    }
}
+ (NSString *)substringAtIndex:(NSUInteger)index withString:(NSString *)targetString{
    NSUInteger trueLengthValue = [targetString trueLengthOfString];         // 判断字符串含几个（人类通常认为的）字符
    NSUInteger codePointLengthValue = [targetString length];
    NSException* rangeException = [NSException exceptionWithName:@"Range Error" reason:@"Range or index out of bounds" userInfo:nil];
    if(index <= trueLengthValue){
        int substringStartCodePoint = 0;
        for (int trueLengthCounter = 0; trueLengthCounter < index;){
            unsigned short characterIntegerValue = [targetString characterAtIndex:substringStartCodePoint];
            if (0xD800 <= characterIntegerValue && 0xDBFF >= characterIntegerValue){
                unsigned short nextCharacterIntegerValue = [targetString characterAtIndex:(substringStartCodePoint + 1)];
                if (0xDC00 <= nextCharacterIntegerValue && 0xDFFF >= nextCharacterIntegerValue){
                    substringStartCodePoint += 2;
                    ++trueLengthCounter;
                }
                else{
                    ++substringStartCodePoint;
                    ++trueLengthCounter;
                }
            }
            else{
                ++substringStartCodePoint;
                ++trueLengthCounter;
            }
        }
        unsigned short characterIntegerValue = [targetString characterAtIndex:substringStartCodePoint];
        if (0xD800 <= characterIntegerValue && 0xDBFF >= characterIntegerValue){
            if (substringStartCodePoint < codePointLengthValue){
                unsigned short nextCharacterIntegerValue = [targetString characterAtIndex:(substringStartCodePoint + 1)];
                if (0xDC00 <= nextCharacterIntegerValue && 0xDFFF >= nextCharacterIntegerValue){
                    return [targetString substringWithRange:NSMakeRange(substringStartCodePoint, 2)];
                }
                else{
                    return [targetString substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
                }
            }
            else{
                return [targetString substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
            }
        }
        else if(0x0000 <= characterIntegerValue && 0x00FF >= characterIntegerValue){
            // resultCharArray[0] = (char)0x0000;
            return [targetString substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
        }
        else{
            return [targetString substringWithRange:NSMakeRange(substringStartCodePoint, 1)];
        }
    }else{
        @throw rangeException;
    }
}
@end

