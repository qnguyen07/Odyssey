import SwiftUI
struct ThirdView: View {
  func buttonPressed(){
  }
  var body: some View {
    ZStack {
        Color(Color(red: 227/255, green: 237/255, blue: 255/255))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        VStack {
            HStack {
              Text("France")
                .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                .font(.system(size: 35, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading], 15)
                .scaledToFit()
                .minimumScaleFactor(0.5)
              Spacer()
              Button(action:{
                buttonPressed()
              }) {
                Menu{
                  NavigationLink(destination: Content()) {
                    Button(action: { }) {
                      Text("Home")
                    }
                  }
                  NavigationLink(destination: SecondView()) {
                    Button(action: { }) {
                      Text("Your Passport")
                    }
                  }
                  NavigationLink(destination: FourthView()) {
                    Button(action: { }) {
                      Text("Your Rankings")
                    }
                  }
                  NavigationLink(destination: FifthView()) {
                    Button(action: { }) {
                      Text("Travel Quiz")
                    }
                  }
                } label: {
                  Label(
                    title: {Text("") },
                    icon: {Image(systemName: "line.3.horizontal.decrease.circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                      .padding(20)}
                  )
                }
              }
            } // top hstack
            ScrollView {
              VStack {
                Text("The Louvre")
                      .font(.system(size: 23, design: .default))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding([.leading], 15)
                  
                ScrollView(.horizontal, showsIndicators: false){
                  HStack {
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  } // images hstack
                } // scrollview
                .padding([.leading], 13)
                .padding([.trailing], 13)
                ZStack {
                  (Rectangle()
                    .frame(width: 370, height: 125)
                    .foregroundColor(.white))
                  .cornerRadius(10)
                  .padding([.top], 9)
                  .padding([.bottom], 20)
                  Text("The quick brown fox jumps over the lazy dog. Five boxing wizards jump quickly. Sphinx of black quartz judge my vow. Watch jeopardy Alex Trebek's fun TV quiz game.")
                    .padding([.top], -25)
                    .padding([.bottom], -10)
                    .padding([.leading], 25)
                    .padding([.trailing], 25)
                }
                Text("Eiffel Tower")
                  .font(.system(size: 23, design: .default))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding([.leading], 15)
                ScrollView(.horizontal, showsIndicators: false){
                  HStack {
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  } // images hstack
                } // scrollview
                .padding([.leading], 13)
                .padding([.trailing], 13)
                ZStack {
                  (Rectangle()
                    .frame(width: 370, height: 125)
                    .foregroundColor(.white))
                  .cornerRadius(10)
                  .padding([.top], 9)
                  .padding([.bottom], 20)
                  Text("The quick brown fox jumps over the lazy dog. Five boxing wizards jump quickly. Sphinx of black quartz judge my vow. Watch jeopardy Alex Trebek's fun TV quiz game.")
                    .padding([.top], -25)
                    .padding([.bottom], -10)
                    .padding([.leading], 25)
                    .padding([.trailing], 25)
                }
                Text("Jardin des Plantes")
                  .font(.system(size: 23, design: .default))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding([.leading], 15)
                ScrollView(.horizontal, showsIndicators: false){
                  HStack {
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image("mountain")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 140, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  } // images hstack
                } // scrollview
                .padding([.leading], 13)
                .padding([.trailing], 13)
                ZStack {
                  (Rectangle()
                    .frame(width: 370, height: 125)
                    .foregroundColor(.white))
                  .cornerRadius(10)
                  .padding([.top], 9)
                  .padding([.bottom], 20)
                  Text("The quick brown fox jumps over the lazy dog. Five boxing wizards jump quickly. Sphinx of black quartz judge my vow. Watch jeopardy Alex Trebek's fun TV quiz game.")
                    .padding([.top], -25)
                    .padding([.bottom], -10)
                    .padding([.leading], 25)
                    .padding([.trailing], 25)
                }
              }
            }
          }
        }
      
  }
}
#Preview {
  ThirdView()
}
