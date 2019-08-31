//
//  DashboardViewController.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/27/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
class DashboardViewController: UIViewController {
    var dashboardRouter: DashboardRouter!
    var eventsArray = [Event]()
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardRouter = DashboardRouter(currentViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do {
            eventsArray =  try context.fetch(Event.fetchRequest())
        } catch let error as NSError {
            print(error)
        }
    }
    @IBAction func onLogoutButton(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        dashboardRouter.navigate(to: .loggedOut)
    }
    
    @IBAction func onMenuButton(_ sender: Any) {
        let firend = Event(entity: Event.entity(), insertInto: context)
        firend.header = "name \(eventsArray.count)"
        firend.subheader = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        firend.startdate  = NSDate()
        eventsArray.append(firend)
        let index = IndexPath(row: eventsArray.count-1, section: 0)
        mCollectionView.insertItems(at: [index])
        CoreDataManager.sharedManager.saveContext()
        
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dashBoardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        let data = eventsArray[indexPath.row]
        dashBoardCollectionViewCell.mHeaderLabel.text = data.header
        dashBoardCollectionViewCell.mDescriptionLabel.text = data.subheader
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        dashBoardCollectionViewCell.mStartDate.text = formatter.string(from: data.startdate! as Date)
        return dashBoardCollectionViewCell
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    //Use for interspacing
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    private func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width-20) /  3, height: (self.view.frame.width-20) /  3)
    }
}
