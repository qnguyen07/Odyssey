//
//  CanvasView.swift
//  ToDos
//
//  Created by Anna Khulup on 8/18/24.
//
import SwiftUI

struct CanvasView: View {
    @Binding var paths: [Path]
    @Binding var currentPath: Path
    @Binding var isDrawing: Bool
    @Binding var currentColor: Color

    var body: some View {
        Canvas { context, size in
            // Drawing each path with the current color
            for path in paths {
                context.stroke(path, with: .color(currentColor))
            }
            
            // Draw the current path being drawn
            context.stroke(currentPath, with: .color(currentColor))
        }
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in
                if isDrawing {
                    let newPath = Path { path in
                        path.addLines([value.startLocation, value.location])
                    }
                    currentPath.addPath(newPath)
                }
            }
            .onEnded { _ in
                paths.append(currentPath)
                currentPath = Path()
                isDrawing = false
            }
        )
    }
}

