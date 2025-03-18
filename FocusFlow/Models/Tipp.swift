//
//  TippModel.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 07.03.25.
//

import Foundation


struct Tipp: Codable, Identifiable, Hashable {
    let id: UUID
    let text: String
    let category: String

}
