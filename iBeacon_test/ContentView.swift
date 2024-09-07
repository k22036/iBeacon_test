//
//  ContentView.swift
//  iBeacon_test
//
//  Created by k22036kk on 2024/09/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var beaconReceiver = BeaconReceiver()
    
    var body: some View {
        Text("Scanning for beacons...")
    }
}

#Preview {
    ContentView()
}
