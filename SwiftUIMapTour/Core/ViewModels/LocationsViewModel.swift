//
//  LocationsViewModel.swift
//  SwiftUIMapTour
//
//  Created by saul on 6/19/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]

    // Current location on map
    @Published var currentLocation: Location {
        didSet {
            updateMapRegion(location: currentLocation)
        }
    }

    // Current Map region on map
    @Published var mapRegion = MapCameraPosition.region(MKCoordinateRegion())

    // Coordinate Span
    private let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    @Published var showLocationsList: Bool = false

    init() {
        self.locations = LocationsDataService.locations
        self.currentLocation = LocationsDataService.locations.first!
        updateMapRegion(location: currentLocation)
    }

    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MapCameraPosition.region(
                MKCoordinateRegion(center: location.coordinates, span: coordinateSpan)
            )
        }
    }

    func toggleShowLocationsList() {
        withAnimation {
            showLocationsList.toggle()
        }
    }

    func showNewLocation(location: Location) {
        withAnimation(.easeInOut) {
            currentLocation = location
            showLocationsList = false
        }
    }
}
