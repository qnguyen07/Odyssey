//
//  StampData.swift
//  ToDos
//
//  Created by Anna Khulup on 8/18/24.
//

import SwiftUI

class StampData: ObservableObject {
    @Published var stamps: [PointWrapper] = []
}
