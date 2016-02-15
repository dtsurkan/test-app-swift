//
//  ClientsListScreenViewInput.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//
import UIKit

protocol ClientsListScreenViewInput: class 
{

    func update(withData data:[ChatDomainModel])
    func updateWithoutData()
    
}
