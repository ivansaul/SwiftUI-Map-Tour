//
//  LocationsView.swift
//  SwiftUIMapTour
//
//  Created by saul on 6/19/24.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var locationsVM: LocationsViewModel
    var body: some View {
        ZStack {
            Map(position: $locationsVM.mapRegion)
            VStack {
                header
                    .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        let currentLocation = locationsVM.currentLocation
        let showLocationsList = locationsVM.showLocationsList
        return VStack {
            Button(action: locationsVM.toggleShowLocationsList) {
                Text("\(currentLocation.name), \(currentLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: showLocationsList ? 180 : 0))
                    }
            }

            if showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.5), radius: 10, y: 10)
        .foregroundStyle(.primary)
    }
}