//
//  CustomNaviButtonModifier.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct CustomNaviButtonModifier : ViewModifier {
    
    var backButtonImageName : String
    
    var rightButton : (imageName : String, function :() -> Void)?
    
    var size : CGSize = CGSize(width: 24, height: 24)
    
    var foregroundColor : Color = .white
    
    
    @Environment(\.presentationMode) var presentation
    
    @ViewBuilder
    func body(content: Content) -> some View {
        
        if #available(iOS 14, *) {
      
            content
            .navigationBarBackButtonHidden ( true )
            .toolbar(content: {
                
                ToolbarItem (placement: .navigationBarLeading)  {
               
                    HStack {
                    
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        })
                        {
                            buttonImage(imageName: self.backButtonImageName)
                                
                        }
                       
                        Spacer()
                    }
                    
                }
                
                
                ToolbarItem (placement: .navigationBarTrailing)  {
                    HStack {
                    
                        Spacer()
                    
                        if let rightButton = self.rightButton {
                       
                            Button(action: {
                                rightButton.function()
                            })
                            {
                                buttonImage(imageName:  rightButton.imageName )
                                    
                            }
                        }
                   
                    }
                }
                
            
            } )
                
        }
        else {
            
            content
            .navigationBarBackButtonHidden ( true )
            .navigationBarItems(leading:
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    buttonImage(imageName:  self.backButtonImageName)
                }
            )
            
            .navigationBarItems(trailing:
                                    
               
                Button(action: {
           
                    if let rightButton = self.rightButton {

                        rightButton.function()
                    }
                }){
                    
                    if let rightButton = self.rightButton {

                        buttonImage(imageName:  rightButton.imageName)
                    }
                }

               
            )
        }
    }
    

}


extension CustomNaviButtonModifier {
    
    @ViewBuilder
    private func buttonImage(imageName : String) -> some View  {
        
        if let img = UIImage(named: imageName) {
            
            Image(uiImage: img)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
               
        }
        else {
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .foregroundColor(foregroundColor)
                
              
        }
    }
}
