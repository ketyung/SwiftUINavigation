//
//  Screen2.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 28/01/2021.
//

import SwiftUI

struct Screen2 : View {
    
    var hasNavigation : Bool = false
    
    var body: some View {
        
        NavigationLink(destination: Screen3()){
            Text("Screen 3")
        }
        .navigation(title: "Screen 2")
        .withNavigationView(hasNavigation,
            backgroundColor: .blue,
            titleColor: .white)
    
    }
}



struct Screen2_preview : PreviewProvider {
    
    static var previews: some View {
        
        Screen2()
    }
}
