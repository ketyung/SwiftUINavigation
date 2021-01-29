//
//  WithNavigationViewWrapperModifier.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct WithNavigationViewWrapperModifier : ViewModifier {
    
    var withNavigationView : Bool
    
    init(withNavigationView : Bool, backgroundColor : UIColor? = nil, titleColor : UIColor? = nil , tintColor : UIColor? = nil)
    {
        self.withNavigationView = withNavigationView
        if ( withNavigationView ){
            
            Theme.navigationBarColors(background: backgroundColor ?? .clear ,
                                      titleColor: titleColor ?? .black, tintColor:  tintColor)
        }
        
    }
    
    @ViewBuilder
    func body(content: Content) -> some View {
    
        if (withNavigationView){
            
            NavigationView {
                
                content
            }
            .navigationViewStyle(StackNavigationViewStyle())

        }
        else {
            
            content
        }
    }
}
