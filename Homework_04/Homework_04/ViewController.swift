import UIKit

class ViewController: UIViewController {

    var total: Double = 0
    let anyArray: [Any] = [3.14, 2.71, 67, 21, "Pi num", "E num", true, false]
    let anyDict: [String: Any] = ["Int": 1, "Double": 1.0, "String": "string", "Boolean": true, "AnotherString": "1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(anyArray)
        printValues(in: anyArray) // 1.1
        getTypeOfValue(in: anyArray) // 1.2
        getKeysAndValues(of: anyDict) // 1.3
        process(of: anyDict) // 1.4
        stringToInt(in: anyDict) // 1.5
    }

    // 1.1 Создайте коллекцию типа [Any], включающую несколько дробных чисел, целых, строк и значений логического типа. Выведите содержимое коллекции на консоль.

    func printValues(in array: [Any]) {
        for value in array {
            print(value)
        }
    }

    // 1.2 Переберите коллекцию и для каждого целого числа выведите на консоль "Целое число " и его значение. Повторите то же самое для дробных чисел, строк и булевых значений.

    private func getTypeOfValue(in array: [Any]) {
        for value in array {
            switch value {
            case is Int:
                print("Int")
            case is Double:
                print("Double")
            case is String:
                print("String")
            default:
                print("Bool")
            }
        }
    }

    // 1.3 Создайте словарь [String : Any], где все значения — это смесь дробных и целых чисел, строк и булевых значений. Переберите словарь и выведете на консоль пары ключ/значения для всех элементов коллекции.
    private func getKeysAndValues(of dict: [String: Any]) {
        for (key, value) in dict {
            print(key, value)
        }
    }

    // 1.4 Создайте переменную total типа Double, равную 0. Переберите все значения словаря, и добавьте значение каждого целого и дробного числа к значению вашей переменной. Для каждой строки добавьте 1. Для каждого булева значения, добавьте 2, в случае, если значение равно true, либо вычтите 3, если оно false. Выведите на консоль значение total.

    private func process(of dict: [String: Any]) {
        for (_, value) in dict {
            switch value {
            case let intValue as Int:
                total += Double(intValue)
            case let doubleValue as Double:
                total += doubleValue
            case _ as String:
                total += 1
            case let boolValue as Bool:
                if boolValue {
                    total += 2
                } else {
                    total -= 3
                }
            default:
                print("Error")
            }
        }
        print(total)
    }

    // 1.5 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему. Игнорируйте булевы значения.  Распечатайте итог.

    private func stringToInt(in dict: [String: Any]) {
        total = 0

        for (_, value) in dict {
            switch value {
            case let stringValue as String:
                if let stringValue = Int(stringValue) {
                    total += Double(stringValue)
                }
            default:
                print("Error")
            }
        }
        print(total)
    }
}

class Workout {
    let time: Double
    let distance: Double

    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }

}

final class Run: Workout {
    let cadence: Double

    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }

    func discribeRun(runningWorkout: Run) {
        print(runningWorkout.cadence, runningWorkout.distance, runningWorkout.time)
    }

}

final class Swim: Workout {
    let stroke: String

    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }

    func discribeSwim(swimmingWorkout: Swim) {
        print(swimmingWorkout.stroke, swimmingWorkout.distance, swimmingWorkout.time)
    }

}

let workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "вольный стиль", time: 32.1, distance: 50),
    Swim(stroke: "баттерфляй", time: 36.8, distance: 50),
    Swim(stroke: "вольный стиль", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

func userWorkoutsDescription() {
    for workout in workouts {
        switch workout {
        case let workout as Run:
            print(workout.cadence, workout.distance, workout.time)
        case let workout as Swim:
            print(workout.stroke, workout.distance, workout.time)
        default:
            print("Error")
        }
    }
}
