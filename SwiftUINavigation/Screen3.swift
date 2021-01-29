//
//  Screen3.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 28/01/2021.
//
import SwiftUI

struct Screen3 : View {
    
    var hasNavigation : Bool = false
    
    var body: some View {
        
        Text("Screen 3")
        .navigation(title: "Screen 3")
        .withNavigationView(hasNavigation,
            backgroundColor: .brown,
            titleColor: .white)
    
    }
}



struct Screen3_preview : PreviewProvider {
    
    static var previews: some View {
        
        Screen3()
    }
}
