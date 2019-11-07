//
//  ViewController.swift
//  jsonParsingDemo1
//
//  Created by Agstya Technologies on 07/10/19.
//  Copyright © 2019 Mayur. All rights reserved.
//

import UIKit

//MARK:- Structure
struct JSONTest:Decodable {
    let name: String
    let capital: String
    let flag: String
}

class ViewController: UIViewController {
    
    //MARK:- Variable declaration
    var arrData = [JSONTest]()
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    //MARK:- Othger Methods
    func requestData() {
        let url = URL(string: "http://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrData = try JSONDecoder().decode([JSONTest].self, from: data!)
                    
                    //for mainArr in self.arrData {
                       // print(mainArr.name,":",mainArr.capital)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    //}
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    }

//MARK:- TableView Controller
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLbl.text = "Name: \(arrData[indexPath.row].name)🌏"
        cell.capitalLbl.text = "Capital: \(arrData[indexPath.row].capital)🏛"
        return cell
    }

}

