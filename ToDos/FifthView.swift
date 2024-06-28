
//  quiziz
//
//  Created by Anna Khulup on 6/21/24.
//

import SwiftUI
import UIKit

struct FifthView: View {
  @StateObject var quiz  = Quiz()
  @State var a = 0
  @State var b = 0
  @State var c = 0
  @State var d = 0
  
  @State var row = 0
  func buttonPressed(){
  }
  var body: some View {
      ZStack{
          Color(.white)
              .ignoresSafeArea()
              .navigationBarBackButtonHidden(true)
          if quiz.printer() > -1
          {
              
              
              VStack (spacing: -5){
                  Button(action:{
                    buttonPressed()
                  }) {
                    Menu{
                      NavigationLink(destination: ContentView()) {
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
                          Text("Your Ranking")
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
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.black)
                            .padding(20)}
                      )
                    }
                  }
                  Text(quiz.asker())
                      .font(.system(size: 25, weight: .semibold, design: .default))
                      .padding([.top], 85)
                      .padding([.bottom], 20)
                  HStack (spacing: 20)
                  {
                      VStack{
                          Button(action: {
                              a = a + 1
                              row = row + 1
                              quiz.adder()
                              
                          }) {
                              Image(quiz.images[row][0])
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 150, height: 150)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                          }
                          
                          Button(quiz.answers[row][0])
                          {
                              a = a + 1
                              quiz.adder()
                              row = row + 1
                              
                              
                          }
                          .foregroundColor(.black)
                          .padding([.top], 5)
                      }
                      VStack{
                          Button(action: {
                              b = b + 1
                              quiz.adder()
                              row = row + 1
                          }) {
                              Image(quiz.images[row][1])
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 150, height: 150)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                          }
                          Button(quiz.answers[row][1])
                          {
                              b = b + 1
                              quiz.adder()
                              row = row + 1
                              
                              
                          }
                          .foregroundColor(.black)
                          .padding([.top], 5)
                      }
                  } // hstack
                  .padding([.bottom])
                  HStack (spacing: 20){
                      VStack{
                          Button(action: {
                              c = c + 1
                              quiz.adder()
                              row = row + 1
                          }) {
                              Image(quiz.images[row][2])
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 150, height: 150)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                          }
                          Button(quiz.answers[row][2])
                          {
                              c = c + 1
                              quiz.adder()
                              row = row + 1
                          }
                          .foregroundColor(.black)
                          .padding([.top], 5)
                      }
                      VStack{
                          Button(action: {
                              d = d + 1
                              quiz.adder()
                              row = row + 1
                          }) {
                              Image(quiz.images[row][3])
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 150, height: 150)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                          }
                          Button(quiz.answers[row][3])
                          {
                              d = d + 1
                              quiz.adder()
                              row = row + 1
                          }
                          .foregroundColor(.black)
                          .padding([.top], 5)
                      }
                  } //hstack
                  Spacer()
              }
          }
          
          else
          {
              if a > b && a > b && a > d
              {
                  NavigationStack {
                      VStack {
                          Button(action:{
                            buttonPressed()
                          }) {
                            Menu{
                              NavigationLink(destination: ContentView()) {
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
                                  Text("Your Ranking")
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
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .foregroundColor(.black)
                                  .padding(20)}
                              )
                            }
                          }
                          Text("You should go to...")
                              .font(.system(size: 25, weight: .regular, design: .default))
                              .padding([.top], 80)
                              .padding([.leading], -3)
                              .padding([.bottom], 7)
                              .multilineTextAlignment(.center)
                          Text("New York City!")
                              .font(.system(size: 25, weight: .bold, design: .default))
                              .padding([.bottom], 20)
                              .padding([.trailing], 15)
                              .multilineTextAlignment(.center)
                          Image("newyork")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 350, height: 250)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                          Spacer()
                          NavigationLink(destination: FifthView()) {
                              Text("Take it again")
                                  .font(.system(size: 20, weight: .regular, design: .default))
                                  .padding([.bottom], 50)
                          }
                          
                      }
                  }
              }
              
              else if b > a && b > c && b > d
              {
                  NavigationStack {
                      VStack {
                          Button(action:{
                            buttonPressed()
                          }) {
                            Menu{
                              NavigationLink(destination: ContentView()) {
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
                                  Text("Your Ranking")
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
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .foregroundColor(.black)
                                  .padding(20)}
                              )
                            }
                          }
                          Text("You should go to...")
                              .font(.system(size: 25, weight: .regular, design: .default))
                              .padding([.top], 80)
                              .padding([.leading], -3)
                              .padding([.bottom], 7)
                              .multilineTextAlignment(.center)
                          Text("the Maldives!")
                              .font(.system(size: 25, weight: .bold, design: .default))
                              .padding([.bottom], 20)
                              .padding([.trailing], 15)
                              .multilineTextAlignment(.center)
                          Image("maldives")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 350, height: 250)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                          Spacer()
                          NavigationLink(destination: FifthView()) {
                              Text("Take it again")
                                  .font(.system(size: 20, weight: .regular, design: .default))
                                  .padding([.bottom], 50)
                          }
                          
                      }
                  }
              }
              
              else if c > a && c > b && c > d
              {
                  NavigationStack {
                      ZStack {
                          
                          VStack {
                              Button(action:{
                                buttonPressed()
                              }) {
                                Menu{
                                  NavigationLink(destination: ContentView()) {
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
                                      Text("Your Ranking")
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
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundColor(.black)
                                      .padding(20)}
                                  )
                                }
                              }
                              Text("You should go to...")
                                  .font(.system(size: 25, weight: .regular, design: .default))
                                  .padding([.top], 80)
                                  .padding([.leading], -3)
                                  .padding([.bottom], 7)
                                  .multilineTextAlignment(.center)
                              Text("Switzerland!")
                                  .font(.system(size: 25, weight: .bold, design: .default))
                                  .padding([.bottom], 20)
                                  .padding([.trailing], 15)
                                  .multilineTextAlignment(.center)
                              Image("switzerland")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 350, height: 250)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                              Spacer()
                              NavigationLink(destination: FifthView()) {
                                  Text("Take it again")
                                      .font(.system(size: 20, weight: .regular, design: .default))
                                      .padding([.bottom], 50)
                              }
                              
                          }
                      }
                  }
              } //else if
              else if c > a && c > b && c > d
              {
                  NavigationStack {
                      ZStack {
                          
                          VStack {
                              Button(action:{
                                buttonPressed()
                              }) {
                                Menu{
                                  NavigationLink(destination: ContentView()) {
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
                                      Text("Your Ranking")
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
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundColor(.black)
                                      .padding(20)}
                                  )
                                }
                              }
                              Text("You should go to...")
                                  .font(.system(size: 25, weight: .regular, design: .default))
                                  .padding([.top], 80)
                                  .padding([.leading], -3)
                                  .padding([.bottom], 7)
                                  .multilineTextAlignment(.center)
                              Text("Yosemite!")
                                  .font(.system(size: 25, weight: .bold, design: .default))
                                  .padding([.bottom], 20)
                                  .padding([.trailing], 15)
                                  .multilineTextAlignment(.center)
                              Image("switzerland")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 350, height: 250)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                              Spacer()
                              NavigationLink(destination: FourthView()) {
                                  Text("Take it again")
                                      .font(.system(size: 20, weight: .regular, design: .default))
                                      .padding([.bottom], 50)
                              }
                              
                          }
                      }
                  }
              } //else if
              else if d > a && d > b && d > c
              {
                  NavigationStack {
                      ZStack {
                          
                          VStack {
                              Text("You should go to...")
                                  .font(.system(size: 25, weight: .regular, design: .default))
                                  .padding([.top], 125)
                                  .padding([.leading], -3)
                                  .padding([.bottom], 7)
                                  .multilineTextAlignment(.center)
                              Text("Yosemite!")
                                  .font(.system(size: 25, weight: .bold, design: .default))
                                  .padding([.bottom], 20)
                                  .padding([.trailing], 15)
                                  .multilineTextAlignment(.center)
                              Image("switzerland")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 350, height: 250)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                              Spacer()
                              NavigationLink(destination: FourthView()) {
                                  Text("Take it again")
                                      .font(.system(size: 20, weight: .regular, design: .default))
                                      .padding([.bottom], 50)
                              }
                              
                          }
                      }
                  }
              } //else if
              else {
                  NavigationStack {
                      ZStack {
                          
                          VStack {
                              Text("You should go to...")
                                  .font(.system(size: 25, weight: .regular, design: .default))
                                  .padding([.top], 125)
                                  .padding([.leading], -3)
                                  .padding([.bottom], 7)
                                  .multilineTextAlignment(.center)
                              Text("Yosemite!")
                                  .font(.system(size: 25, weight: .bold, design: .default))
                                  .padding([.bottom], 20)
                                  .padding([.trailing], 15)
                                  .multilineTextAlignment(.center)
                              Image("yosemite")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 350, height: 250)
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                              Spacer()
                              NavigationLink(destination: FourthView()) {
                                  Text("Take it again")
                                      .font(.system(size: 20, weight: .regular, design: .default))
                                      .padding([.bottom], 50)
                              }
                              
                          }
                      }
                  }
              }
              
              
              
              
              
              
          }
      }
  }
}
  
  #Preview {
      FourthView()
  }
