//
//  Greeny_iOSApp.swift
//  Greeny-iOS
//
//  Created by 김대희 on 2023/05/17.
//

import SwiftUI

@main
struct GreenyiOSApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    MainTabView()
                }
                .accentColor(.black)

            } else {
                // Fallback on earlier versions
                NavigationView {
                    MainTabView()
                }
                .accentColor(.black)

            }
        }
    }
}
