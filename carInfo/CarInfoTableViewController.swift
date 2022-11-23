//
//  ViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.05.22.
//

import UIKit



final class CarInfoTableViewController: UITableViewController {

    
    var dataProvider: dataProvider
    init(dataProvider: dataProvider) {
        self.dataProvider = dataProvider
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CarInfoTableViewCell.self, forCellReuseIdentifier: "CarInfoTableViewCell")
        tableView.backgroundColor = .white
        tableView.keyboardDismissMode = .onDrag
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationDidChangeBack), name: .init(rawValue: "redBackInMainScreen"), object: nil)
        
      
    }
    
    @objc func notificationDidChangeBack(_ notification: NSNotification) {
       
    }


    private var lastSelectedIndexPath: IndexPath? = nil
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CarCategoryHeader()
        view.title = dataProvider.header(forSection: section)
        return view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Карта", style: .plain, target: self, action: #selector(gotoMap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Игра", style: .plain, target: self, action: #selector(goToGame))
    }
    @objc private func gotoMap() {
        self.navigationController?.pushViewController(MapViewController(), animated: true)
        
        
//
        
    }
    @objc private func goToGame() {
//       
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.carsCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.carsCount(forSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarInfoTableViewCell", for: indexPath) as? CarInfoTableViewCell
       
        
        cell?.update(dataModel: dataProvider.getCars(withIdexPath: indexPath))
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = dataProvider.getCars(withIdexPath: indexPath)
        
        lastSelectedIndexPath = indexPath
    }
    
    
    
}

