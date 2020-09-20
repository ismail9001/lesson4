//
//  ViewController.swift
//  lesson4
//
//  Created by macbook on 15.09.2020.
//  Copyright © 2020 Iskander Nizamov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        class Car {
            
            let mark: String
            let year: Int
            
            func action (check: carActions) {
            }
            
            init(mark: String, year: Int) {
                self.mark = mark
                self.year = year
            }
        }
        
        class SportCar: Car {
            var maxSpeed: Int
            let fuelConsumption: Double
            var laps = 0
            
            override func action(check: carActions) {
                switch check {
                case .circleRace:
                    laps = 10
                    maxSpeed = 157
                    print("Car is first in chamionship")
                case .halfMileRace:
                    laps = 0
                    maxSpeed = 276
                    print("Car is only second")
                default :
                    print ("No trunkCar methods")
                }
            }
            init(maxSpeed: Int, fuelConsumption: Double, mark: String, year: Int) {
                self.maxSpeed = maxSpeed
                self.fuelConsumption = fuelConsumption
                super.init(mark: mark, year: year)
            }
        }
        
        class TrunkCar: Car {
            let maxWeightLimit: Int
            var trunkLoaded = 0
            var fullDrive: Bool
            let trunkVolume: Int
            var trunkVolumeFill = 0
            
            override func action(check: carActions) {
                switch check {
                case .trunkLoad:
                    if trunkLoaded < maxWeightLimit {
                        trunkLoaded += 1000
                    } else {
                        print("Car is fully loaded")
                    }
                    
                case .goodsDelivery:
                    if fullDrive == true {
                        print("Good able be delivered to North")
                    } else {
                        print("Good able be delivered to South")
                    }
                default :
                    print ("No trunkCar methods")
                }
            }
            
            init(maxWeightLimit:Int, fullDrive:Bool, trunkVolume: Int, mark: String, year: Int){
                self.maxWeightLimit = maxWeightLimit
                self.fullDrive = fullDrive
                self.trunkVolume = trunkVolume
                super.init(mark: mark, year: year)
            }
        }
        
        enum carActions {
            case trunkLoad, goodsDelivery, circleRace, halfMileRace
        }
        
        let ferrari = SportCar(maxSpeed: 307, fuelConsumption: 24.9, mark: "Ferrari", year: 2012)
        let lambo = SportCar(maxSpeed: 237, fuelConsumption: 23.5, mark: "Lamborgini", year: 2010)
        
        ferrari.action(check: .circleRace)
        lambo.action(check: .trunkLoad)
        
        let kamaz = TrunkCar(maxWeightLimit: 5647, fullDrive: true, trunkVolume: 10000, mark: "Kamaz", year: 2017)
        let maz = TrunkCar(maxWeightLimit: 9853, fullDrive: false, trunkVolume: 8000, mark: "Maz", year: 2015)
        
        kamaz.action(check: .halfMileRace)
        maz.action(check: .goodsDelivery)
        
    }
}
