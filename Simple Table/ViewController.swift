//
//  ViewController.swift
//  Simple Table
//
//  Created by Vladimir Rybalka on 03/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextViewDelegate {
    
    private let dwarves = [
        "Соня", "Чихоня", "Робкий", "Счастливчик", "Док", "Сердитый", "Кумар", "Торин", "Дорин", "Нори", "Ори", "Балин", "Двалин", "Фили", "Кили", "Оин", "Глоин", "Бифур", "Бофур", "Бомбур"
    ]
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        
        if(cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIdentifier)
        }
        cell!.textLabel?.text = dwarves[indexPath.row]
        
        return cell!
    }
}

