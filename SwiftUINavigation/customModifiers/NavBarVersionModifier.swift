//
//  NavBarVersionModifier.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct NaviBarVersionModifier : ViewModifier {
    
    var title : String
    var displayMode: NavigationBarItem.TitleDisplayMode
    
    
    @ViewBuilder
    func body(content: Content) -> some View {
        
        if #available(iOS 14, *) {
            content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode( displayMode)
        }
        else {
        
            content.navigationBarTitle(title,displayMode: displayMode)
        }
    }
}
