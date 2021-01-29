//
//  Screen4.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 28/01/2021.
//

import SwiftUI

struct Screen4 : View {
    
    @State private var showScreen2 : Bool = false
    
    var body: some View{
        
        Button(action: {
            
            self.showScreen2.toggle()
        }
        , label: {
            
            Text("Present Screen 2 in a sheet")
        })
        .sheet(isPresented: self.$showScreen2, content: {
        
            Screen2(hasNavigation: true)
        })
        .navigation(title: "Screen 4")

    }
}
