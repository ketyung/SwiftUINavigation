//
//  View1.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct View1  : View {
    
    var withNavigationView : Bool = true

    var body: some View {
        
            
        NavigationLink( destination:  View2()){
            
            Text("Go To View 2")
        }
        .navigation(title: "View 1")
        .navigationButtons(backButtonImageName: "arrow.backward.square")
        .withNavigationView(withNavigationView, backgroundColor: .blue, titleColor: .yellow)
    }
    
}
