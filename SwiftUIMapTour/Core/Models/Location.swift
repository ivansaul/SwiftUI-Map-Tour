//
//  Location.swift
//  SwiftUIMapTour
//
//  Created by saul on 6/19/24.
//

import Foundation
import MapKit

struct Location {
    let id: String = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}
