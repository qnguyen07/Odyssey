import SwiftUI

struct PointWrapper: Hashable {
    let id = UUID()
    let point: CGPoint
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PointWrapper, rhs: PointWrapper) -> Bool {
        return lhs.id == rhs.id
    }
}

struct SecondView: View {
    @State private var circles: [PointWrapper] = []
    
    func buttonPressed() {
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Stamps")
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .padding([.leading], 27)
                    .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                Spacer()
                Button(action: {
                    buttonPressed()
                }) {
                    Menu {
                        NavigationLink(destination: Content()) {
                            Button(action: { }) {
                                Text("Home")
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
                            title: { Text("") },
                            icon: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                                    .foregroundColor(Color(red:28/255, green: 57/255, blue: 105/255))
                                    .padding([.trailing], 20)
                            }
                        )
                    }
                }
            }
            .padding([.bottom], 49)
            
            ZStack {
                    Color(Color(red: 227/255, green: 237/255, blue: 255/255))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture { location in
                        let tapLocation = CGPoint(x: location.x, y: location.y)
                        let wrappedPoint = PointWrapper(point: tapLocation)
                        circles.append(wrappedPoint)
                    }
                
                ForEach(circles, id: \.id) { wrappedPoint in
                    Circle()
                        .fill(Color.black)
                        .frame(width: 100, height: 100)
                        .position(wrappedPoint.point)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(Color(red: 227/255, green: 237/255, blue: 255/255)))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
  SecondView()
}


