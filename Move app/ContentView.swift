//
//  ContentView.swift
//  Move app
//
//  Created by 吉田史織 on 2023/02/23.
//

import SwiftUI

struct ContentView: View{
    //入力中の文字列を保持する状態変数
    @State var inputText1 = ""
    @State var inputText2 = ""
    //検索キーワードを保持する状態変数
    @State var dispSearchKey1: String = ""
    @State var dispSearchKey2: String = ""
    
    
    var body: some View {
        VStack{
            HStack{
                //1多言語対応で使われるタイトルキー2入力中の文字を保存する状態変数3入力欄に表示するメッセージ
                TextField("出発地点", text: $inputText1, prompt: Text("出発地点を入力してください"))
                
                    .onSubmit{
                        dispSearchKey1 = inputText1
                    }
                    .padding()
                //1多言語対応で使われるタイトルキー2入力中の文字を保存する状態変数3入力欄に表示するメッセージ
                TextField("到着地点", text: $inputText2, prompt: Text("到着地点を入力してください"))
                
                    .onSubmit{
                        dispSearchKey2 = inputText2
                    }
                    .padding()
            }
            MapView(searchKey1: dispSearchKey1,
                   searchKey2:dispSearchKey2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
