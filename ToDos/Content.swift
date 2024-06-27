import SwiftUI
struct Content: View {
    func buttonPressed(){
    }
    func plusButton(){
            //print("meow")
    }
    var body: some View {
        NavigationStack{
            ZStack {
                Color(Color(red: 227/255, green: 237/255, blue: 255/255))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                VStack {
                    HStack {
                        Text("Odyssey")
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                            .padding(27)
                        Spacer()
                        Button(action:{
                            buttonPressed()
                        }) {
                            Menu{
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
                            }
                        label: {
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
                    }
                    ScrollView(showsIndicators: false){
                        VStack {
//
                            VStack (spacing: 0.1) {
                                ZStack {
                                    (Rectangle()
                                        .frame(width: 350, height: 275)
                                        .foregroundColor(.white))
                                    .cornerRadius(13)
                                    .padding(10)
                                    VStack {
                                        HStack {
                                            Image("mountain")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 160, height: 160)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            Image("mountain")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 160, height: 160)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        } // hstack
                                        NavigationLink(destination: ThirdView()) {
                                            Text("France")
                                                .underline(true, color: .gray)
                                                .font(.system(size: 25, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .foregroundColor(.black)
                                                .padding([.leading], 35)
                                                .padding([.bottom], 4)
                                        } // nav link
                                        Text("The quick brown fox jumps over the lazy dog. Sphinx of black quartz judge my vow.")
                                            .padding([.leading], 35)
                                            .padding([.trailing], 35)
                                    } // vstack
                                } // zstack
                                ZStack {
                                    (Rectangle()
                                    .frame(width: 350, height: 200)
                                    .foregroundColor(.white))
                                .cornerRadius(13)
                                .padding(10)
                                } // zstack
                                ZStack { (Rectangle()
                                    .frame(width: 350, height: 200)
                                    .foregroundColor(.white))
                                .cornerRadius(13)
                                .padding(10)
                                } // zstack
                                ZStack { (Rectangle()
                                    .frame(width: 350, height: 200)
                                    .foregroundColor(.white))
                                .cornerRadius(13)
                                .padding(10)
                                } // zstack
                            } // vstack
                }
                    } // closes vstack
                
            }
                VStack{
                  Spacer()
                 HStack{
                  Button(action:{plusButton()}) {
                      Image("Plus")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 80, height: 80)
                       .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                       .padding(-17)
                       
                  } // button
                 //.contentShape(Circle())
                 } // button hstack
                } //button vstack
               } // closes zstack
               } // button
              } // closes body
             } // closes struct
            #Preview {
             Content()
            }

