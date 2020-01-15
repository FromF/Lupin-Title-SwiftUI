//
//  ContentView.swift
//  Lupin-Title
//
//  Created by 藤治仁 on 2020/01/15.
//  Copyright © 2020 F-Works. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var lupinTitleViewModel = LupinTitleViewModel()
    
    var body: some View {
        Group {
            if lupinTitleViewModel.isTyping {
                ZStack {
                    Color(.black)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        Text(lupinTitleViewModel.typeWrite)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("音楽：魔王魂")
                            .foregroundColor(.white)
                    }
                }
            } else {
                VStack {
                    TextField("Title", text: $lupinTitleViewModel.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        self.lupinTitleViewModel.startTitleCall()
                    }) {
                        Text("Start")
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
