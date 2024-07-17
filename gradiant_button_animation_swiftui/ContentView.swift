import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text("Obada Alhalabi")
            }).buttonStyle(GradientButtonStyle())
        }
       
    }
}

struct GradientButtonStyle : ButtonStyle{
    
    let gredientColors = Gradient(colors: [.red, .orange, .yellow , .green, .blue, .purple , .pink])
    
    @State var isAnimating = false
    @State var test = false
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            configuration.label.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .foregroundStyle(.white)
                .frame(width: 300, height: 80)
                .background(.black , in: .rect(cornerRadius: 10))
                .overlay(){ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AngularGradient.init(gradient: gredientColors, center: .center, angle: .degrees(isAnimating ? 360 : 0)), lineWidth: 6)
                }}
                .scaleEffect(test ? 1.1 : 1)
                            
        }
        .onAppear(){
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)){
                isAnimating = true
            }
            //
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)){
                self.test.toggle()
            }
            
        }
        
    }
    
}


#Preview {
    ContentView()
}
