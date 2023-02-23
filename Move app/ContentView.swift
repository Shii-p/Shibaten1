//
//  ContentView.swift
//  Move app
//
//  Created by 吉田史織 on 2023/02/23.
//

import SwiftUI

struct ContentView: View{
    
    @State var inputText = ""
    @State var dispSearchKey: String = ""
    
    
    var body: some View {
        VStack{
            
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
            
                .onSubmit{
                    dispSearchKey = inputText
                }
                .padding()
            MapView(searchKey: dispSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
