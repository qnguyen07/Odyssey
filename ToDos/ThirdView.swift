import SwiftUI
import SwiftUIImageViewer
import SwiftData
import PhotosUI

struct ThirdView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var item: Item
    @State private var subEntries: [SubEntry] = []
    @State private var showingAddSubEntry = false

    var body: some View {
        ZStack {
            Color(Color(red: 227/255, green: 237/255, blue: 255/255))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 28/255, green: 57/255, blue: 105/255))
                    
                    ForEach(subEntries) { subEntry in
                        SubEntryView(subEntry: subEntry)
                    }
                    
                    Button(action: {
                        showingAddSubEntry = true
                    }) {
                        Text("Add New Place")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingAddSubEntry) {
            AddSubEntryView { newSubEntry in
                subEntries.append(newSubEntry)
            }
        }
        .onAppear {
            // Load existing subentries if any
            subEntries = item.subEntries ?? []
        }
        .onDisappear {
            // Save subentries to the main item
            item.subEntries = subEntries
        }
    }
}

struct SubEntry: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var imageData: Data?
}

struct SubEntryView: View {
    let subEntry: SubEntry
    @State private var isImageViewerPresented = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(subEntry.title)
                .font(.title2)
                .fontWeight(.bold)
            
            if let imageData = subEntry.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
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
                                        .padding()
                                        .background(Color.black.opacity(0.6))
                                        .clipShape(Circle())
                                }
                                .padding()
                            }
                    }
            }
            
            Text(subEntry.description)
                .font(.body)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


struct AddSubEntryView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var selectedPhoto: UIImage?
    @State private var isImagePickerShowing = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var onSave: (SubEntry) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Title", text: $title)
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
                
                Section(header: Text("Image")) {
                    if let image = selectedPhoto {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    
                    Button("Select Image") {
                        isImagePickerShowing = true
                    }
                }
            }
            .navigationTitle("Add New Place")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    let newSubEntry = SubEntry(
                        title: title,
                        description: description,
                        imageData: selectedPhoto?.jpegData(compressionQuality: 0.8)
                    )
                    onSave(newSubEntry)
                    presentationMode.wrappedValue.dismiss()
                }
            )
            .sheet(isPresented: $isImagePickerShowing) {
                ImagePicker(selectedPhoto: $selectedPhoto, isImagePickerShowing: $isImagePickerShowing, sourceType: sourceType)
            }
        }
    }
}
// Make sure to update your Item model to include subEntries
