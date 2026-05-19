import UIKit

struct TrafficLightModel {

    enum LightState {
        case none
        case red
        case yellow
        case green
    }

    var currentLight: LightState = .none

    mutating func switchLight() {
        switch currentLight {
        case .none:
            currentLight = .red
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
}
