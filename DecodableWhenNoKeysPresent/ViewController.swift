//
//  ViewController.swift
//  DecodableWhenNoKeysPresent
//
//  Created by Dimic Milos on 5/5/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let data = """
    [{
        "id": 1,
        "array": [
            [
                "Sunny",
                13.5,
                70
            ],
            [
                "Cloudy",
                2.5,
                10
            ]
        ]
    },
    {
            "id": 2,
            "array": [
                [
                    "Snow",
                    -14,
                    90
                ],
                [
                    "Rain",
                    7,
                    100
                ]
            ]
        }]
    """.data(using: .utf8)!
    
    struct Foo: Decodable {
        let id: Int
        let array: [Bar]
    }
    
    struct Bar: Decodable {
        
        let weatherDescription: String
        let temperature: Double
        let humidity: Int
        
        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            weatherDescription = try container.decode(String.self)
            temperature =  try container.decode(Double.self)
            humidity = try container.decode(Int.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decode()
    }

    func decode() {
        do {
             let foos = try JSONDecoder.init().decode([Foo].self, from: data)
            print(foos)
        } catch {
            print(error)
        }
       
        
        
    }

}

