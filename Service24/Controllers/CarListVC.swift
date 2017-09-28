//
//  CarListVC.swift
//  Service24
//
//  Created by Захар on 26.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit
import Alamofire

class CarListVC: UIViewController {
    
    let basisURL = "http://95.213.195.115"
    var person = Person()
    var cars = [Car]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.getCarList()
        }
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        goToNextVC()
    }
    
    fileprivate func setCarsData(_ json: NSArray, _ carData: inout NSDictionary!) {
        var id: Int64
        var model: String
        var mark: String
        var vinCode: String
        var number: String
        
        for car in json {
            carData = car as! NSDictionary
            id = carData.object(forKey: "id") as! Int64
            model = carData.object(forKey: "car_model") as! String
            mark = carData.object(forKey: "car_mark") as! String
            vinCode = carData.object(forKey: "vin_code") as! String
            number = carData.object(forKey: "car_number") as! String
            
            self.cars.append(Car(id: id, model: model, mark: mark, vinCode: vinCode, number: number))
        }
    }
    
    func getCarList() {
        let url = "/api/userauto"
        let header: HTTPHeaders = ["Authorization": "Bearer " + person.token]
        
        Alamofire.request(basisURL + url, method: .get, headers: header).responseJSON { (response) in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            let statusCode = response.response?.statusCode
            
            if statusCode == 200 {
                let json = response.result.value as! NSArray
                var carData: NSDictionary!
                
                self.setCarsData(json, &carData)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func goToNextVC() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        
        newViewController.person = person
        
        self.present(newViewController, animated: true, completion: nil)
    }
}

extension CarListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarCell {
            
            cell.updateCell(car: cars[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}





