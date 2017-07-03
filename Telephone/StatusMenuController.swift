//
//  StatusMenuController.swift
//  Telephone
//
//  Created by Max Klein on 29.06.2017.
//
//

import Cocoa

class StatusMenuController: NSObject {
    private let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
   
    private lazy var showItem: NSMenuItem = {
        let menuItem = NSMenuItem(title: NSLocalizedString("Show…", comment: "Show the account window"),
                                  action: #selector(showClicked(_:)),
                                  keyEquivalent: "")
        
        menuItem.target = self
        return menuItem
    }()
    
    private lazy var quitItem: NSMenuItem = {
        let menuItem = NSMenuItem(title: NSLocalizedString("Quit", comment: "Quit Button"),
                                  action: #selector(quitClicked(_:)),
                                  keyEquivalent: "")
        
        menuItem.target = self
        return menuItem
    }()
    
    lazy var statusMenu: NSMenu = {
        let menu = NSMenu(title: "StatusMenu")
        menu.addItem(self.showItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(self.quitItem)
        
        return menu
    }()
    
    @objc private func showClicked(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        NSApp.windows.forEach {
            if $0.windowController is AccountController {
                $0.windowController?.showWindow(nil)
            }
        }
    }
    
    @objc private func quitClicked(_ sender: NSMenuItem) {
        NSApp.terminate(sender)
    }
    
    @objc private func stateClicked(_ sender: NSMenuItem) {
        
    }
    
}
