//
//  main.m
//  category3
//
//  Created by Qwetional on 27/6/2019.
//  Copyright © 2019 Qwetional. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iostream>
#import "NSString+CustomMethod.h"

int main(int argc, const char * argv[]) {
    NSLog(@"%lu", [@"神𪚾雖壽" trueLengthOfString]);
    NSString* str1 = @"𠥓𪚾雖壽";
    NSString* str2 = @"@啊𠥓𤵖";
    NSLog(@"%@", [str2 substringAtIndex:0]);
    // NSLog(@"%@", [str2 substringAtIndex:1]);
    NSLog(@"%@", [str2 substringAtIndex:2]);
    if([[str2 substringAtIndex:2] isEqualToString:@"𠥓"]){
        NSLog(@"True");
    }
    NSString* str3 = @"@啊𪚾𤵖";
    NSLog(@"%@", [str3 substringAtIndex:0]);
    // NSLog(@"%@", [str2 substringAtIndex:1]);
    NSLog(@"%@", [str3 substringAtIndex:2]);
    NSLog(@"%@", [str2 substringAtIndex:3]);
    NSLog(@"%lu", [NSString trueLengthOfString:str1]);
    NSLog(@"%@", [str1 substringAtIndex:0]);
    NSLog(@"%@", [str1 substringAtIndex:1]);
    NSLog(@"%@", [str1 substringAtIndex:2]);
    NSLog(@"%@", [str1 substringAtIndex:3]);
    NSLog(@"%@", [NSString substringAtIndex:1 withString:@"𠥓𪚾雖壽"]);
    NSLog(@"%@", [NSString substringAtIndex:2 withString:@"𠥓𪚾雖壽"]);
    NSLog(@"%@", [NSString substringAtIndex:2 withString:@"𠥓ss𪚾雖壽"]);
    NSLog(@"%@", [NSString substringAtIndex:3 withString:@"𠥓ss𪚾雖壽"]);
    NSLog(@"%@", [NSString substringAtIndex:5 withString:@"𠥓ss𪚾雖壽"]);
    NSLog(@"%@", [NSString substringAtIndex:3 withString:@"ABCD"]);
    NSLog(@"%C", [@"@啊𠥓𤵖" characterAtIndex:0]);
    NSLog(@"%C", [@"@啊𠥓𤵖" characterAtIndex:2]);
    NSLog(@"%C", [@"@啊𠥓𤵖" characterAtIndex:3]);
    NSLog(@"%@", [NSString substringAtIndex:1 withString:@"𠥓𐀀𐀀𪚾雖壽"]);
    NSString* str5 = @"𠥓𐀀𐀀𪚾雖壽";
    NSLog(@"%@", [str5 substringAtIndex:2]);
    NSLog(@"%lu", [str5 trueLengthOfString]);
    return 0;
}

