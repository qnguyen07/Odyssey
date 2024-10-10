//
//  Item.swift
//  ToDos
//
//  Created by Tunde Adegoroye on 06/06/2023.
//
import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    @Relationship(deleteRule: .nullify, inverse: \Category.items)
    var category: Category?
    @Attribute(.externalStorage)
    var image: Data?
    var image2: Data?
    @Attribute(.externalStorage)
    var subEntriesRaw: Data?

    init(title: String = "",
         timestamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }

    var subEntries: [SubEntry]? {
        get {
            if let data = subEntriesRaw {
                return try? JSONDecoder().decode([SubEntry].self, from: data)
            }
            return nil
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                subEntriesRaw = encoded
            }
        }
    }
}

extension Item {
    static var dummy: Item {
        .init(title: "Item 1",
              timestamp: .now,
              isCritical: true)
    }
}
