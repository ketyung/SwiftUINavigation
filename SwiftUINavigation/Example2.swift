//
//  PushToView2.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 09/01/2021.
//

import SwiftUI


struct Example2: View {
    
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Hope your day is\n bright and sunny")
        
            NavigationLink (destination:
        
                HStack (spacing: 30){
                    
                    Image(systemName: "ant")
                    Image(systemName: "ladybug")
                    Image(systemName: "ant")
                    
                }
            
            ){
               Text("Next")
            }
        }
     
    }
}



struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        
        Example2()
    }
}
