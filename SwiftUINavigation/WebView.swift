//
//  WebView.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 10/01/2021.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
       // print("req.url::\(String(describing: request.url))")
        uiView.load(request)
    }
    
}

struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://blog.techchee.com/category/swiftui/")!))
    }
}
