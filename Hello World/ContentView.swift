//
//  ContentView.swift
//  Hello World
//
//  Created by octopus on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://i.ibb.co/5jPgJ7y/IMG-6527.jpg")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, This is Ibrahim!")
            
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 500, height: 50)
                
                HStack{
                    Link("Tap here to email me", destination: URL(string: "mailto:ch.ibrahim@colorado.edu")!)
                        .foregroundColor(.white)
                    
                    Image(systemName: "plus.message.fill")
                        .background(.blue)
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
