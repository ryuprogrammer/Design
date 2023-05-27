//
//  CustomTabBarView_Tab.swift
//  Design
//
//  Created by トム・クルーズ on 2023/05/27.
//

import SwiftUI

/// App Tab' s
enum CustomTabBarView_Tab: String, CaseIterable {
    // Raw Value Used as Tab Title
    case home = "Home"
    case services = "Services"
    case partners = "Pertners"
    case activity = "Activity"
    
    // SF Symbol Image
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "envelope.open"
        case .partners:
            return "hand.raised"
        case .activity:
            return "bell"
        }
    }
    
    // Return Current Tab Index
    var index: Int {
        return CustomTabBarView_Tab.allCases.firstIndex(of: self) ?? 0
    }
}
