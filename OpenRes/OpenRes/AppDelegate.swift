//
//  AppDelegate.swift
//  OpenRes
//
//  Created by Bailey on 2017-09-30.
//  Copyright © 2017 Bailey Cosier. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(printQuote(_:))
        }
        
        constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {}
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Hello World!"
        let quoteAuthor = "Baileys"
        
        print("\(quoteText) - \(quoteAuthor)")
    }
    
    @objc func showPreferences(_ sender: Any?) {
        print("Showing preferences")
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Switch Res",
                                action: #selector(AppDelegate.showPreferences(_:)),
                                keyEquivalent: "r"))
        menu.addItem(NSMenuItem(title: "Preferences",
                                action: #selector(AppDelegate.showPreferences(_:)),
                                keyEquivalent: ","))
        
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(NSMenuItem(title: "Quit",
                                action: #selector(NSApplication.terminate(_:)),
                                keyEquivalent: "q"))
        
        statusItem.menu = menu
    }

}



