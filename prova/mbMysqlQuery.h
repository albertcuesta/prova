//
//  mbMysqlQuery.h
//  prova
//
//  Created by Albert on 20/4/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//
/*
#import <Foundation/Foundation.h>

@class mbMysqlDB;

@interface mbMysqlQuery : NSObject
{
    mbMysqlDB* db;
    NSMutableArray* rowsArray;
    NSInteger num_fields;
}

- (id)initWithDatabase:(mbMysqlDB*)dbase; // initializer
- (void)execQuery; // execute query with sql
- (NSInteger)recordCount; // return number rows in result query
- (NSString*)stringValFromRow:(int)row Column:(int)col; // return string from row and column col
- (NSInteger)integerValFromRow:(int)row Column:(int)col;//return NSInteger from row and column col
- (double)doubleValFromRow:(int)row Column:(int)col; // return double from row and column col

@property (copy)NSString* sql;

@end
*/