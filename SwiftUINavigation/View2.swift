//
//  View2.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct View2  : View {
    
   // @Environment(\.presentationMode) private var presentation
    
    
    var body: some View {
        
        Text("View 2")
        .navigation(title: "View 2")
        .navigationButtons(backButtonImageName: "arrow.backward.circle")
        
        /**
         .navigationBarBackButtonHidden(true)
            
        .toolbar(content: {
            
            ToolbarItem (placement: .navigation)  {
           
               Image(systemName: "arrow.left")
               .foregroundColor(.white)
               .onTapGesture {
                    self.presentation.wrappedValue.dismiss()
               }
            }
        
        })
         .navigationBarItems(leading:
             Image(systemName: "arrow.left")
             .foregroundColor(.white)
             .onTapGesture {
                  self.presentation.wrappedValue.dismiss()
             }
         )
        
         */
    }
    
}


extension View2 {
    
    
    private func littleFancyBackButton() -> some View {
        
        ZStack {
            
            Circle().fill(Color.green)
                .frame(width: 30, height: 30)
            Circle().fill(Color.blue)
                .frame(width: 20, height: 20)
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
        }
    }
}
