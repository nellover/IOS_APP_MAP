import SwiftUI

struct ContentView: View {
    
    @State private var textColor = Color.black
    
    var body: some View {
        VStack {
            Text("color is :")
            //Text( "$\(textColor)")
                .foregroundColor(textColor)
            Button("change color "){
                if(textColor == .red)
                {
                    textColor = .pink
                }
                else {
                    textColor = .red
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
