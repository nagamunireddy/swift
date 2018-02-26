//
//  ViewController.swift
//  aniamtedview
//
//  Created by Adroitent INC on 23/02/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//
import UIKit

class ExpandableViewController: UIViewController {
    @IBOutlet weak var expandTable: UITableView!
    
    var expandData = [NSMutableDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.expandData.append(["isOpen":"1","data":["banana","mango"]])
        self.expandData.append(["isOpen":"1","data":["banana","mango","apple"]])
        self.expandData.append(["isOpen":"1","data":["banana"]])
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
class ExpandCell:UITableViewCell{
    
}

extension ExpandableViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.expandData[section].value(forKey: "isOpen") as! String == "1"{
            return 0
        }else{
            let dataarray = self.expandData[section].value(forKey: "data") as! NSArray
            return dataarray.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.expandData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expand", for: indexPath) as! ExpandCell
        let dataarray = self.expandData[indexPath.section].value(forKey: "data") as! NSArray
        cell.expandLbl.text = dataarray[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = UIColor.gray
        let label = UILabel(frame: CGRect(x: 5, y: 3, width: headerView.frame.size.width - 5, height: 27))
        label.text = "\(section)"
        headerView.addSubview(label)
        headerView.tag = section + 100
        
        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
        headerView.addGestureRecognizer(tapgesture)
        return headerView
    }
    @objc func sectionTapped(_ sender: UITapGestureRecognizer){
        if(self.expandData[(sender.view?.tag)! - 100].value(forKey: "isOpen") as! String == "1"){
            self.expandData[(sender.view?.tag)! - 100].setValue("0", forKey: "isOpen")
        }else{
            self.expandData[(sender.view?.tag)! - 100].setValue("1", forKey: "isOpen")
        }
        self.expandTable.reloadSections(IndexSet(integer: (sender.view?.tag)! - 100), with: .automatic)
    }
}
