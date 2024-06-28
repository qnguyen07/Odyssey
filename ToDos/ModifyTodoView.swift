//
//  ModifyTodoView.swift
//  ToDos
//
//  Created by Tunde Adegoroye on 06/06/2023.
//
//
import SwiftUI
import SwiftData
import PhotosUI
struct CreateTodoView: View {
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  @Query private var categories: [Category]
  @State var item = Item()
  @State var selectedCategory: Category?
  @State var selectedPhoto: PhotosPickerItem?
  @State var selectedImage: PhotosPickerItem?
  @State var isImagePickerShowing = false
  @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
  var body: some View {
    List {
      Section("Destination Title") {
        TextField("Name", text: $item.title)
      }
      Section("General") {
        DatePicker("Choose a date",
              selection: $item.timestamp)
      }
      Section("") {
        if categories.isEmpty {
          ContentUnavailableView("No Categories",
                      systemImage: "archivebox")
        } else {
          Picker("", selection: $selectedCategory) {
            ForEach(categories) { category in
              Text(category.title)
                .tag(category as Category?)
            }
            Text("None")
              .tag(nil as Category?)
          }
          .labelsHidden()
          .pickerStyle(.inline)
        }
      }
      Section {
        if let selectedPhotoData = item.image,
          let uiImage = UIImage(data: selectedPhotoData) {
          Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 300)
        }
        if let selectedPhotoData = item.image2,
          let uiImage = UIImage(data: selectedPhotoData) {
          Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 300)
        }
        PhotosPicker(selection: $selectedPhoto,
               matching: .images,
               photoLibrary: .shared()) {
          Label("Choose First Image", systemImage: "photo")
        }
        PhotosPicker(selection: $selectedImage,
               matching: .images,
               photoLibrary: .shared()) {
          Label("Choose Second Image", systemImage: "photo")
        }
        Button("Take a picture"){
          self.sourceType = .camera
          self.isImagePickerShowing.toggle()
        }
        if item.image != nil {
          Button(role: .destructive) {
            withAnimation {
              selectedPhoto = nil
              item.image = nil
            }
          } label: {
            Label("Remove Image", systemImage: "xmark")
              .foregroundStyle(.red)
          }
        }
        if item.image2 != nil {
          Button(role: .destructive) {
            withAnimation {
              selectedImage = nil
              item.image2 = nil
            }
          } label: {
            Label("Remove Image", systemImage: "xmark")
              .foregroundStyle(.red)
          }
        }
      }
      Section {
        Button("Create") {
          save()
          dismiss()
        }
      }
    }
    .navigationTitle("Create Destination")
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Dismiss") {
          dismiss()
        }
      }
      ToolbarItem(placement: .primaryAction) {
        Button("Done") {
          save()
          dismiss()
        }
        .disabled(item.title.isEmpty)
      }
    }
    .task(id: selectedPhoto) {
      if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
        item.image = data
      }
    }
    .task(id: selectedImage) {
      if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
        item.image2 = data
      }
    }
  }
}
private extension CreateTodoView {
  func save() {
    modelContext.insert(item)
    item.category = selectedCategory
    selectedCategory?.items?.append(item)
  }
}
///
