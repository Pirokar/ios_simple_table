//
//  ViewController.swift
//  Simple Table
//
//  Created by Vladimir Rybalka on 03/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    // MARK: Table Data Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        
        if(cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.imageView?.image = #imageLiteral(resourceName: "star")
        cell?.imageView?.highlightedImage = #imageLiteral(resourceName: "star2")
        
        if(indexPath.row < 7) {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell!.textLabel?.text = dwarves[indexPath.row]
        cell!.textLabel?.font = UIFont .boldSystemFont(ofSize: 50)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if(indexPath.row == 0) {
            return nil
        } else {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "Вы выбрали \(rowValue)"
        
        let controller = UIAlertController(title: "Выбрана строка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "А то", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
}

