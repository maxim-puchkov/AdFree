//
//  ContentBlockerRequestHandler.swift
//  AdFree: Blocker
//  com.maximpuchkov.AdFree.AdFree.ContentBlockerRequestHandler
//
//  Created by mpuchkov on 2019-07-21. macOS 10.14, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit
import MobileCoreServices

class ContentBlockerRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "blockerList", withExtension: "json"))!
        
        let item = NSExtensionItem()
        item.attachments = [attachment]
        
        context.completeRequest(returningItems: [item], completionHandler: nil)
    }
    
}
