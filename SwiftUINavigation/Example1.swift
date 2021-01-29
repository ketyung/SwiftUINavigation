//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 09/01/2021.
//

import SwiftUI

struct Example1 : View {
   
    var withNavigation : Bool = false
    
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Hope your day is\n bright and sunny")
        
            NavigationLink (destination: Text("Your second screen")
            ){
                Text("Next")
            }
        }
        .withNavigationView(withNavigation)
    
    }

}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1()
    }
}
