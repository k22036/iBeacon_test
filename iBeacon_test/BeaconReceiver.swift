//
//  BeaconReceiver.swift
//  iBeacon_test
//
//  Created by k22036kk on 2024/09/07.
//

import Foundation
import CoreLocation

class BeaconReceiver: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager: CLLocationManager!
    var beaconRegion: CLBeaconRegion!
    
    override init() {
        super.init()
        
        // CLLocationManagerの初期化
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // 位置情報使用許可をリクエスト（必須）
        locationManager.requestWhenInUseAuthorization()
        
        // iBeaconのUUIDを設定（ここでは例としてUUIDを設定）
//        e2c56db5 dffb 48d2 b060 d0f5a71096e0
        let uuid = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")! // あなたのiBeaconのUUIDを使用
        beaconRegion = CLBeaconRegion(uuid: uuid, identifier: "MyBeacon")
        
        // レンジング（ビーコンとの距離測定）を開始
        locationManager.startRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: uuid))
    }
}

// CLLocationManagerDelegateメソッド
extension BeaconReceiver {
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            switch beacon.proximity {
            case .immediate:
                print("Beacon is very close!")
            case .near:
                print("Beacon is near.")
            case .far:
                print("Beacon is far away.")
            default:
                print("Beacon is unknown.")
            }
            
            print("Beacon Major: \(beacon.major), Minor: \(beacon.minor), RSSI: \(beacon.rssi)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
}
