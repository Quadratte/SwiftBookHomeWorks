import UIKit

struct AdjustColorModel {
    private(set) var red: Float = 0.5
    private(set) var green: Float = 0.5
    private(set) var blue: Float = 0.5

    mutating func setRed(_ value: Float) {
        red = max(0, min(1, value))
    }


    mutating func setGreen(_ value: Float) {
        green = max(0, min(1, value))
    }

    mutating func setBlue(_ value: Float) {
        blue = max(0, min(1, value))
    }

    func getRedFormatted() -> String {
        String(format: "%.2f", red)
    }

    func getGreenFormatted() -> String {
        String(format: "%.2f", green)
    }

    func getBlueFormatted() -> String {
        String(format: "%.2f", blue)
    }

    func getUIColor() -> UIColor {
        UIColor(red: CGFloat(red),
                green: CGFloat(green),
                blue: CGFloat(blue),
                alpha: 1.0)
    }
}
