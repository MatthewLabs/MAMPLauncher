//
//  AppDelegate.m
//  MAMPStarter
//
//  Created by Matteo Del Vecchio on 15/06/13.
//  Copyright (c) 2013 Matteo Del Vecchio. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self serversInitialCheck];
}

-(BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
	[_window makeKeyAndOrderFront:nil];
	return YES;
}

-(void)serversInitialCheck
{
	NSString *script = @"ps aux | grep httpd && ps aux | grep mysql55";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\"", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (result)
	{
		NSRange apacheRunning = [result.stringValue rangeOfString:@"_www"];
		NSRange mySQLRunning = [result.stringValue rangeOfString:@"_mysql"];
		
		if (apacheRunning.location != NSNotFound && mySQLRunning.location != NSNotFound)
		{
			self.apacheImageView.image = [NSImage imageNamed:@"greenCircle"];
			self.mySQLImageView.image = [NSImage imageNamed:@"greenCircle"];
			
			[self.startServersButton setEnabled:NO];
			[self.stopServersButton setEnabled:YES];
			[self.restartApacheButton setEnabled:YES];
			[self.forceApacheButton setEnabled:YES];
			[self.restartMySQLButton setEnabled:YES];
			[self.openPhpMyAdminButton setEnabled:YES];
			[self.startMenuItem setEnabled:NO];
			[self.stopMenuItem setEnabled:YES];
			[self.restartApacheMenuItem setEnabled:YES];
			[self.forceApacheMenuItem setEnabled:YES];
			[self.restartMySQLMenuItem setEnabled:YES];
			[self.openPhpMyAdminMenuItem setEnabled:YES];
		}
		else if (apacheRunning.location == NSNotFound && mySQLRunning.location != NSNotFound)
		{
			self.apacheImageView.image = [NSImage imageNamed:@"redCircle"];
			self.mySQLImageView.image = [NSImage imageNamed:@"greenCircle"];
			
			[self.startServersButton setEnabled:YES];
			[self.stopServersButton setEnabled:NO];
			[self.restartApacheButton setEnabled:NO];
			[self.forceApacheButton setEnabled:NO];
			[self.restartMySQLButton setEnabled:NO];
			[self.openPhpMyAdminButton setEnabled:NO];
			[self.startMenuItem setEnabled:YES];
			[self.stopMenuItem setEnabled:NO];
			[self.restartApacheMenuItem setEnabled:NO];
			[self.forceApacheMenuItem setEnabled:NO];
			[self.restartMySQLMenuItem setEnabled:NO];
			[self.openPhpMyAdminMenuItem setEnabled:NO];
		}
		else if (apacheRunning.location != NSNotFound && mySQLRunning.location == NSNotFound)
		{
			self.apacheImageView.image = [NSImage imageNamed:@"greenCircle"];
			self.mySQLImageView.image = [NSImage imageNamed:@"redCircle"];
			
			[self.startServersButton setEnabled:YES];
			[self.stopServersButton setEnabled:NO];
			[self.restartApacheButton setEnabled:NO];
			[self.forceApacheButton setEnabled:NO];
			[self.restartMySQLButton setEnabled:NO];
			[self.openPhpMyAdminButton setEnabled:NO];
			[self.startMenuItem setEnabled:YES];
			[self.stopMenuItem setEnabled:NO];
			[self.restartApacheMenuItem setEnabled:NO];
			[self.forceApacheMenuItem setEnabled:NO];
			[self.restartMySQLMenuItem setEnabled:NO];
			[self.openPhpMyAdminMenuItem setEnabled:NO];
		}
		else
		{
			self.apacheImageView.image = [NSImage imageNamed:@"redCircle"];
			self.mySQLImageView.image = [NSImage imageNamed:@"redCircle"];
			
			[self.startServersButton setEnabled:YES];
			[self.stopServersButton setEnabled:NO];
			[self.restartApacheButton setEnabled:NO];
			[self.forceApacheButton setEnabled:NO];
			[self.restartMySQLButton setEnabled:NO];
			[self.openPhpMyAdminButton setEnabled:NO];
			[self.startMenuItem setEnabled:YES];
			[self.stopMenuItem setEnabled:NO];
			[self.restartApacheMenuItem setEnabled:NO];
			[self.forceApacheMenuItem setEnabled:NO];
			[self.restartMySQLMenuItem setEnabled:NO];
			[self.openPhpMyAdminMenuItem setEnabled:NO];
		}
	}
}

-(IBAction)startServers:(id)sender
{
	NSString *script = @"/opt/local/apache2/bin/apachectl -k start && sudo /opt/local/share/mysql55/support-files/mysql.server start";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (!result)
		NSLog(@"%@", errorInfo);
	else
	{
		self.apacheImageView.image = [NSImage imageNamed:@"greenCircle"];
		self.mySQLImageView.image = [NSImage imageNamed:@"greenCircle"];
		
		[self.startServersButton setEnabled:NO];
		[self.stopServersButton setEnabled:YES];
		[self.restartApacheButton setEnabled:YES];
		[self.forceApacheButton setEnabled:YES];
		[self.restartMySQLButton setEnabled:YES];
		[self.openPhpMyAdminButton setEnabled:YES];
		[self.startMenuItem setEnabled:NO];
		[self.stopMenuItem setEnabled:YES];
		[self.restartApacheMenuItem setEnabled:YES];
		[self.forceApacheMenuItem setEnabled:YES];
		[self.restartMySQLMenuItem setEnabled:YES];
		[self.openPhpMyAdminMenuItem setEnabled:YES];
	}
}

-(IBAction)stopServers:(id)sender
{
	NSString *script = @"/opt/local/apache2/bin/apachectl -k stop && sudo /opt/local/share/mysql55/support-files/mysql.server stop";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (!result)
		NSLog(@"%@", errorInfo);
	else
	{
		self.apacheImageView.image = [NSImage imageNamed:@"redCircle"];
		self.mySQLImageView.image = [NSImage imageNamed:@"redCircle"];
		
		[self.startServersButton setEnabled:YES];
		[self.stopServersButton setEnabled:NO];
		[self.restartApacheButton setEnabled:NO];
		[self.forceApacheButton setEnabled:NO];
		[self.restartMySQLButton setEnabled:NO];
		[self.openPhpMyAdminButton setEnabled:NO];
		[self.startMenuItem setEnabled:YES];
		[self.stopMenuItem setEnabled:NO];
		[self.restartApacheMenuItem setEnabled:NO];
		[self.forceApacheMenuItem setEnabled:NO];
		[self.restartMySQLMenuItem setEnabled:NO];
		[self.openPhpMyAdminMenuItem setEnabled:NO];
	}
}

-(IBAction)restartApache:(id)sender
{
	NSString *script = @"/opt/local/apache2/bin/apachectl -k graceful";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (!result)
		NSLog(@"%@", result);
	else
		NSLog(@"Apache graceful restarted!");
}

-(IBAction)forceApacheRestart:(id)sender
{
	NSString *script = @"/opt/local/apache2/bin/apachectl -k restart";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (!result)
		NSLog(@"%@", result);
	else
		NSLog(@"Apache restarted!");
}

-(IBAction)restartMySQL:(id)sender
{
	NSString *script = @"sudo /opt/local/share/mysql55/support-files/mysql.server restart";
	NSString *fullScript = [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", script];
	
	NSDictionary *errorInfo = [NSDictionary new];
	NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:fullScript];
	NSAppleEventDescriptor *result = [appleScript executeAndReturnError:&errorInfo];
	
	if (!result)
		NSLog(@"%@", result);
	else
		NSLog(@"MySQL restarted!");
}

-(IBAction)openPhpMyAdmin:(id)sender
{
	NSURL *pmaURL = [NSURL URLWithString:@"http://localhost/phpmyadmin/"];
	[[NSWorkspace sharedWorkspace] openURL:pmaURL];
}

@end
