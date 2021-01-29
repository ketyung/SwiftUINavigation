//
//  DetailView.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 09/01/2021.
//

import SwiftUI


struct Book : Decodable {
    
    var imageName : String
    
    var title : String
    
    var description : String
    
}



struct DetailView : View {

    
    @State private var showInfoView : Bool = false
    
    let jsonFile : String

    var body: some View {
   
        let book = Bundle.main.decodeJson( Book.self, fileName: jsonFile)
        
        VStack(alignment: .center, spacing: 30) {
           
            Image(book.imageName)
           
            VStack(alignment: .leading, spacing: 20) {
            
                HStack (alignment: .firstTextBaseline, spacing:20){
                    
                    Text("Book Title    :")
                        .font(.headline)
                    
                    Text(book.title)
                    
                }
                
                HStack (alignment: .firstTextBaseline, spacing:20) {
                    
                    Text("Description :")
                    .font(.headline)
                    
                    Text(book.description)
                    
                }
                
            }
            Spacer()
            
        }
        .padding()
        .navigation(title: "Detail View", displayMode: .inline)
        .navigationButtons(backButtonImageName: "customBackButton", rightButton: (imageName : "info.circle" , function : {
            self.showInfoView.toggle()
        }))
        .sheet(isPresented:  $showInfoView ){
    
            InfoView()//withNavigationView: true)
        }
        /**
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
            }
        )
         */
    }
    
}




struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailView(jsonFile: "Book1.json")
    }
}
