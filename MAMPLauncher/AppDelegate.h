//
//  AppDelegate.h
//  MAMPStarter
//
//  Created by Matteo Del Vecchio on 15/06/13.
//  Copyright (c) 2013 Matteo Del Vecchio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong, nonatomic) IBOutlet NSButton *startServersButton;
@property (strong, nonatomic) IBOutlet NSButton *stopServersButton;
@property (strong, nonatomic) IBOutlet NSButton *restartApacheButton;
@property (strong, nonatomic) IBOutlet NSButton *forceApacheButton;
@property (strong, nonatomic) IBOutlet NSButton *restartMySQLButton;
@property (strong, nonatomic) IBOutlet NSButton *openPhpMyAdminButton;

@property (strong, nonatomic) IBOutlet NSMenuItem *startMenuItem;
@property (strong, nonatomic) IBOutlet NSMenuItem *stopMenuItem;
@property (strong, nonatomic) IBOutlet NSMenuItem *restartApacheMenuItem;
@property (strong, nonatomic) IBOutlet NSMenuItem *forceApacheMenuItem;
@property (strong, nonatomic) IBOutlet NSMenuItem *restartMySQLMenuItem;
@property (strong, nonatomic) IBOutlet NSMenuItem *openPhpMyAdminMenuItem;

@property (strong, nonatomic) IBOutlet NSImageView *apacheImageView;
@property (strong, nonatomic) IBOutlet NSImageView *mySQLImageView;

-(IBAction)startServers:(id)sender;
-(IBAction)stopServers:(id)sender;
-(IBAction)restartApache:(id)sender;
-(IBAction)forceApacheRestart:(id)sender;
-(IBAction)restartMySQL:(id)sender;
-(IBAction)openPhpMyAdmin:(id)sender;

-(void)serversInitialCheck;

@end
