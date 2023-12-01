//
//  DetailsViewController.swift
//  TechnicalTask
//
//  Created by macbook m1 on 29.11.23.
//
import SnapKit
import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Privaet properties
    private var backButton = UIButton()
    private var imageContent = UIImageView()
    private var apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetting()
        imageSetting()
        getInfo()
    }
    
    func getInfo() {
        apiManager.loadImage { [weak self]_  in
            DispatchQueue.main.async {
                self?.imageContent.image = self?.apiManager.randomImage
            }
        }
    }
}

//MARK: -  UIButtonMethod
extension DetailsViewController {
    func buttonSetting() {
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(65)
            make.leading.equalToSuperview().inset(20)
        }
        backButton.setImage(.init(systemName: "list.bullet.rectangle"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backToList) , for: .touchUpInside)
    }
    
    @objc func backToList() {
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc: TableViewController = str.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }
    }
}

//MARK: - UIImageMethod
extension DetailsViewController {
    func imageSetting() {
        view.addSubview(imageContent)
        
        imageContent.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageContent.backgroundColor = .gray
    }
}
