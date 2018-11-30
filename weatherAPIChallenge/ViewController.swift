//
//  ViewController.swift
//  weatherAPIChallenge
//
//  Created by West Kraemer on 11/30/18.
//  Copyright © 2018 West Kraemer. All rights reserved.
//

import UIKit

struct DarkSky: Decodable {
    var currently = Dictionary<String, String>()
    var daily : String
    var flags : String
    var hourly : String
    var latitude : Float
    var longitude : Float
    var minutely : String
    var offset : Int

}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.darksky.net/forecast/59c6b6b7efd5c3fc0f617338cfae6c48/37.8267,-122.4233"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            do {
                let darksky = try JSONDecoder().decode(DarkSky.self, from: data)
                print(darksky.currently)
                DispatchQueue.main.async {
                   // self.displayLabel.text = darkskys.flags
                    
                }
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            
            }.resume()
        
    }
    
      //table view cell will have a label displaying: "The date is \(date), the high is going to be \(high) degrees, the low is going to be \(low), the chance of participation is \(chanceOfRain)%. The weather summary is: \(weatherSummary)."
    
   let weatherAPIArray = ["date,", "high,", "low,", "chanceOfRain,", "weatherSummary"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherAPIArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = weatherAPIArray[indexPath.row]
        return (cell)
    }

    
    
  
    
}
