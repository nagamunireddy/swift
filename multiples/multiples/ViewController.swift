//
//  ViewController.swift
//  multiples
//
//  Created by Adroitent INC on 07/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataValue: Int?
    var items = [] as Array
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for value in 1...100 {
            self.items.append(value)
        }
        print("\(dataValue)")
    }
    
    //getItem()
    
    //        print("\(currentValue)")
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.myLabel.text = "\(items[indexPath.item])"
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        dataValue = items[indexPath.row] as? Int
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "showDetails") as! TableViewController
        viewController.selectedValue = dataValue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? TableViewController {
//            destination.numberData = dataValue?[(tableView.row)!]
//        }

//  performSegue(withIdentifier: "showDetails", sender: self)


//    func getItem() {
//                var numbers = [] as Array
//                numbers = items
//                 print("\(numbers)")
//   }
//


