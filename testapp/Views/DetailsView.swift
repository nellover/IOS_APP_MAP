//
//  DetailsView.swift
//  testapp
//
//  Created by Orangeodc10 on 24/12/2024.
//
/*
import SwiftUI

struct DetailsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
*/
import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("MyNewPrimitiveButton triggered. Is it printed ?")
            }){ Text("My NEW primitive Button").padding() }
                .buttonStyle(MyNewPrimitiveButtonStyle(color: .yellow))

        }
    }
}
 
struct MyNewPrimitiveButtonStyle: PrimitiveButtonStyle {
    var color: Color

    func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        MyButton(configuration: configuration, color: color)
    }
   
    struct MyButton: View {
        @State private var pressed = false

        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color

        var body: some View {

            return configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(color))
                .compositingGroup()
                .shadow(color: .black, radius: 3)
                .opacity(self.pressed ? 0.5 : 1.0)
                .scaleEffect(self.pressed ? 0.8 : 1.0)
                .onLongPressGesture(minimumDuration: 2.5, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.pressed = pressing
                }
                if pressing {
                    print("My long pressed starts")
                    print("     I can initiate any action on start")
                } else {
                    print("My long pressed ends")
                    print("     I can initiate any action on end")
                }
            }, perform: { })
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
