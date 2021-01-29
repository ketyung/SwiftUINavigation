//
//  Example1.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 22/01/2021.
//

import SwiftUI

struct Example4  : View {

    
    var body : some View {
        
        NavigationLink (destination: DetailView(jsonFile: "Book1.json"))
        {
  
            Text("Hello world!")
            .navigation(title: "Home" )
            .navigationButtons(backButtonImageName: "arrow.left")
          
        }
    }
}


struct Example4_Previews : PreviewProvider {
    
    static var previews: some View {
        
        Example4()
    }
}

/**
*/

