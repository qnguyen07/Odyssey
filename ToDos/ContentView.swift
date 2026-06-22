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
            return "textformat.size.larger"
        case .date:
            return "calendar"
        case .category:
            return "folder"
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
                Color(red: 227/255, green: 237/255, blue: 255/255)
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                VStack(spacing: 0) {
                    HStack {
                        Text("Odyssey")
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                            .padding()
                        Spacer()
                        Button(action: {
                            buttonPressed()
                        }) {
                            Menu {
                                NavigationLink(destination: FifthView()) {
                                    Button(action: { }) {
                                        Text("Travel Quiz")
                                    }
                                }
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                                    .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                                    .padding()
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(filteredItems) { item in
                                ItemCardView(item: item, toDoToEdit: $toDoToEdit, modelContext: modelContext)
                            }
                        }
                        .padding(.bottom, 100) // Add padding at the bottom for the plus button
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { plusButton() }) {
                            Image("Plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                                .padding()
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
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
    }
}

struct ItemCardView: View {
    let item: Item
    @Binding var toDoToEdit: Item?
    let modelContext: ModelContext
    @State private var isMenuPresented = false
    
    var body: some View {
        NavigationLink(destination: ThirdView(item: item)) {
            VStack(alignment: .leading, spacing: 10) {
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach([item.image, item.image2], id: \.self) { imageData in
                                if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width, height: 160)
                                        .clipShape(RoundedRectangle(cornerRadius: 13))
                                }
                            }
                        }
                    }
                }
                .frame(height: 160)
                
                HStack {
                    Text(item.title)
                        .underline(true, color: .gray)
                        .font(.system(size: 25, design: .default))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        isMenuPresented = true
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                            .frame(width: 44, height: 44)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Text("This is an example of a description. Write and document your travels here.")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(13)
            .shadow(radius: 2)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
        .confirmationDialog("Options", isPresented: $isMenuPresented) {
            Button("Edit") {
                toDoToEdit = item
            }
            Button("Delete", role: .destructive) {
                modelContext.delete(item)
            }
        }
    }
}
extension Array where Element == Item {
    func sort(on option: SortOption) -> [Item] {
        switch option {
        case .title:
            return self.sorted(by: { $0.title < $1.title })
        case .date:
            return self.sorted(by: { $0.timestamp < $1.timestamp })
        case .category:
            return self.sorted(by: {
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

