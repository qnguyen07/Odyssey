///
import SwiftUI
import SwiftData
import SwiftUIImageViewer

enum SortOption: String, CaseIterable {
  case title
  case date
  case category
}

extension SortOption {
  var systemImage: String {
    switch self {
    case .title:
      "textformat.size.larger"
    case .date:
      "calendar"
    case .category:
      "folder"
    }
  }
}

struct ContentView: View {
  func buttonPressed() {
  }
  
  func plusButton() {
    showCreateToDo.toggle()
  }
  
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]
  @State private var searchQuery = ""
  @State private var showCreateCategory = false
  @State private var showCreateToDo = false
  @State private var toDoToEdit: Item?
  @State private var isImageViewerPresented = false
  @State private var selectedSortOption = SortOption.allCases.first!
  @State var isImagePickerShowing = false
  @State var selectedImage: UIImage?
  @State var selectedPhoto: UIImage?
  
  var filteredItems: [Item] {
    if searchQuery.isEmpty {
      return items.sort(on: selectedSortOption)
    }
    let filteredItems = items.compactMap { item in
      let titleContainsQuery = item.title.range(of: searchQuery,
                                                options: .caseInsensitive) != nil
      let categoryTitleContainsQuery = item.category?.title.range(of: searchQuery,
                                                                  options: .caseInsensitive) != nil
      return (titleContainsQuery || categoryTitleContainsQuery) ? item : nil
    }
    return filteredItems.sort(on: selectedSortOption)
  }
  
  var body: some View {
    NavigationStack {
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
              .padding([.bottom], -20)
            Spacer()
            Button(action: {
              buttonPressed()
            }) {
              Menu {
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
                  icon: { Image(systemName: "line.3.horizontal.decrease.circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                    .padding(20)
                    .padding([.bottom], -25)
                  }
                )
              }
            }
          }
          ScrollView(showsIndicators: false) {
            ForEach(filteredItems) { item in
              VStack {
                VStack(spacing: 0.1) {
                  ZStack {
                    Rectangle()
                      .frame(width: 350, height: 275)
                      .foregroundColor(.white)
                      .cornerRadius(13)
                      .padding(10)
                      .padding([.bottom], -10)
                    VStack {
                      HStack(spacing: 10) {
                        if let selectedPhotoData = item.image,
                           let uiImage = UIImage(data: selectedPhotoData) {
                          Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160, height: 160)
                            .cornerRadius(13)
                            .padding([.top], 12)
                            .onTapGesture {
                              isImageViewerPresented = true
                            }
                            .fullScreenCover(isPresented: $isImageViewerPresented) {
                              SwiftUIImageViewer(image: Image(uiImage: uiImage))
                                .overlay(alignment: .topTrailing) {
                                  Button {
                                    isImageViewerPresented = false
                                  } label: {
                                    Image(systemName: "xmark")
                                      .font(.headline)
                                  }
                                  .buttonStyle(.bordered)
                                  .clipShape(Circle())
                                  .tint(.purple)
                                  .padding()
                                }
                            }
                        }
                        if let selectedPhotoData = item.image2,
                           let uiImage = UIImage(data: selectedPhotoData) {
                          Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160, height: 160)
                            .cornerRadius(13)
                            .padding([.top], 12)
                            .onTapGesture {
                              isImageViewerPresented = true
                            }
                            .fullScreenCover(isPresented: $isImageViewerPresented) {
                              SwiftUIImageViewer(image: Image(uiImage: uiImage))
                                .overlay(alignment: .topTrailing) {
                                  Button {
                                    isImageViewerPresented = false
                                  } label: {
                                    Image(systemName: "xmark")
                                      .font(.headline)
                                  }
                                  .buttonStyle(.bordered)
                                  .clipShape(Circle())
                                  .tint(.purple)
                                  .padding()
                                }
                            }
                        }
                      }
                      HStack {
                          NavigationLink(destination: ThirdView(item: item)) {
                          Text(item.title)
                            .underline(true, color: .gray)
                            .font(.system(size: 25, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .padding([.leading], 35)
                            .padding([.bottom], 4)
                        }
                        Menu {
                          Button(action: {
                            toDoToEdit = item
                          }) {
                            HStack {
                              Image(systemName: "pencil")
                              Text("Edit")
                            }
                          }
                          Button(action: {
                            modelContext.delete(item)
                          }) {
                            HStack {
                              Image(systemName: "trash.fill")
                              Text("Delete")
                            }
                          }
                        } label: {
                          Image(systemName: "ellipsis")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding([.trailing], 40)
                        }
                      }
                      Text("This is an example of a description. Write and document your travels here. ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom], 5)
                        .padding([.leading], 35)
                        .padding([.trailing], 35)
                    }
                  }
                }
              }
            }
          }
          .sheet(isPresented: $showCreateToDo) {
            NavigationStack {
              CreateTodoView()
            }
          }
          .sheet(item: $toDoToEdit) { item in
            NavigationStack {
              UpdateToDoView(item: item)
            }
          }
        }
        VStack {
          Spacer()
          HStack {
            Button(action: { plusButton() }) {
              Image("Plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                .padding(-17)
                .padding([.bottom], -10)
            }
          }
        }
      }
    }
  }
}

private extension [Item] {
  func sort(on option: SortOption) -> [Item] {
    switch option {
    case .title:
      self.sorted(by: { $0.title < $1.title })
    case .date:
      self.sorted(by: { $0.timestamp < $1.timestamp })
    case .category:
      self.sorted(by: {
        guard let firstItemTitle = $0.category?.title,
              let secondItemTitle = $1.category?.title else { return false }
        return firstItemTitle < secondItemTitle
      })
    }
  }
}

#Preview {
  ContentView()
}
