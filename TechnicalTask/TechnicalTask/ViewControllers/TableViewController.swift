//
//  ViewController.swift
//  TechnicalTask
//
//  Created by macbook m1 on 29.11.23.
//
import SnapKit
import UIKit

class TableViewController: UIViewController {
    
    //MARK: - Private properties
    private var myTableView = UITableView()
    private var listNameCell: [String] = ["Image 1", "Image 2", "Image 3", "Image 4", "Image 5", "Image 6", "Image 7", "Image 8", "Image 9", "Image 10", "Image 11", "Image 12", "Image 13"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTableView)
        myTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MyTableCell.self, forCellReuseIdentifier: "MyTableCell")
    }
}

//MARK: -  UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listNameCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath)
        if let nameCell = cell as? MyTableCell {
            nameCell.textLabel?.text = listNameCell[indexPath.item]
            nameCell.imageView?.image = UIImage(systemName: "photo.artframe")
            nameCell.imageView?.tintColor = .darkGray
            
            return  cell
        }
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        openDetailsViewController()
    }
}

//MARK: - Navigation method
extension TableViewController {
    func openDetailsViewController() {
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc: DetailsViewController = str.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
