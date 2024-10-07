//
//  StampAdder.swift
//  ToDos
//
//  Created by Anna Khulup on 7/28/24.

import SwiftUI
import PhotosUI

struct StampAdder: View {
    @EnvironmentObject var stampData: StampData
    @Environment(\.dismiss) var dismiss
    @State var item = Item()
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedImage: PhotosPickerItem?
    @State private var drawingImage: UIImage?
    @State private var isDrawing = false
    @State private var currentPath = Path()
    @State private var paths: [Path] = []
    @State private var currentColor: Color = .black

    var body: some View {
        List {
            Section("Destination Title") {
                TextField("Name", text: $item.title)
            }
            Section("General") {
                DatePicker("Choose a date",
                           selection: $item.timestamp,
                           displayedComponents: .date)
            }
            Section {
                if let drawingImage = drawingImage {
                    Image(uiImage: drawingImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                } else {
                    CanvasView(paths: $paths, currentPath: $currentPath, isDrawing: $isDrawing, currentColor: $currentColor)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .background(Color.white)
                        .cornerRadius(10)
                        .border(Color.black, width: 1)
                }
                
                Button("Save Drawing") {
                    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
                    let img = renderer.image { ctx in
                        UIColor.white.setFill()
                        ctx.fill(CGRect(origin: .zero, size: CGSize(width: 300, height: 300)))
                        UIColor.black.setStroke()
                        paths.forEach { path in
                            path.stroke()
                        }
                    }
                    drawingImage = img
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
                Button("Take a picture") {
                    // Use UIImagePickerController or similar
                }
                
                if item.image != nil {
                    Button(role: .destructive) {
                        withAnimation {
                            item.image = nil
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
    
    private func save() {
        item.image = drawingImage?.pngData()
        stampData.stamps.append(PointWrapper(
            point: CGPoint(x: 0, y: 0), // Default point or modify as needed
            imageData: item.image ?? Data(),
            title: item.title,
            date: item.timestamp
        ))
    }
}
