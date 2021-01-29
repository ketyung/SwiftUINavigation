//
//  Screen1.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 28/01/2021.
//

import SwiftUI

struct Screen1 : View {
    
    var hasNavigation : Bool = true
    
    var body: some View {
        
        NavigationLink(destination: Screen2()){
            Text("Screen 2")
        }
        .navigation(title: "Screen 1")
        .withNavigationView(hasNavigation,
            backgroundColor: .purple,
            titleColor: .white)
       
    }
}


struct Screen1_preview : PreviewProvider {
    
    static var previews: some View {
            
        Screen1()
    }
}
