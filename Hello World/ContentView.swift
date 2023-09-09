import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    @State var result: String = ""
    @State private var backgroundColor = Color.white
    var body: some View {
        VStack {
            profileImage()
            sayHello()
            enterNameToSayHi(userName: $userName, result: $result)
            sendMeAnEmail()
            
            Button("Change Background Color") {
                            backgroundColor = randomColor()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
        }
        .padding()
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    func profileImage() -> some View {
        AsyncImage(url: URL(string: "https://i.ibb.co/TkmQm6B/IMG-6527.jpg")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
    
    func sayHello() -> some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, My Name is Ibrahim!")
        }
    }
    
    func sendMeAnEmail() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 500, height: 50)
            
            HStack {
                Link("Tap here to email me", destination: URL(string: "mailto:ch.ibrahim@colorado.edu")!)
                    .foregroundColor(.white)
                
                Image(systemName: "plus.message.fill")
                    .background(.blue)
                    .foregroundColor(.white)
            }
        }
    }
    
    func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}

struct enterNameToSayHi: View {
    @Binding var userName: String
    @Binding var result: String
    
    var body: some View {
        TextField("To Say Hi! Please Enter Your Name: ", text: $userName)
            .padding()
            .border(Color.gray, width: 0.5)
        
        Button("Submit") {
                       result = "\(userName) says Hi 👋🏼"
                   }
                   .padding()

                   Text(result)
                       .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
