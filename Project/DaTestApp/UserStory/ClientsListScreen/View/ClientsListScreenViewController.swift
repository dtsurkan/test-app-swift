//
//  ClientsListScreenViewController.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class ClientsListScreenViewController: UIViewController, ClientsListScreenViewInput {
    let chatCellIdentifier = "ChatCellIdentifier"

    weak var output: ClientsListScreenViewOutput!
    weak var router: ClientsListScreenRouterInput!

    @IBOutlet weak var table: UITableView!

    var data: [ChatDomainModel]?

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self
        table.delegate = self
        table.dataSource = self
        table.contentInset = UIEdgeInsetsMake(64,0,0,0)
        output.viewIsReady()
    }

    //MARK: - ClientsListScreenViewInput
    func update(withData data: [ChatDomainModel]) {
        self.data = data
        stopSpining()
        if let table = self.table {
            table.reloadData()
        }

    }


    func updateWithoutData() {

    }


    //MARK: - Private
    func stopSpining() {

    }

}

//MARK: - Table Datasource

extension ClientsListScreenViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data {
            return data.count
        }

        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCellWithIdentifier(chatCellIdentifier) as! ChatSummaryCell
        if let data = self.data where data.count > indexPath.row-1
        {
            cell.fill(withModel: data[indexPath.row])
        }
        return cell
    }

}

//MARK: - Table Delegate

extension ClientsListScreenViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if let data = self.data where data.count > indexPath.row-1
        {
            let model =  data[indexPath.row]
            let cellWidth = CGRectGetWidth(table.frame);
            return ChatSummaryCellAdapter.cellHeight(forModel: model, cellWidth: cellWidth)
        }
        
        return 0
    }

}


//MARK: - UIViewControllerTransitioningDelegate

extension ClientsListScreenViewController: UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return router.transitionController()
    }
}

