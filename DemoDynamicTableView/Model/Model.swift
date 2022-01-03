//
//  Model.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 30/12/2021.
//

import Foundation
import UIKit

struct Model {
     var name: String
     var phone: String
     var avt: String
        var imageCovert: UIImage! {
        return UIImage(named: avt)
    }
}

//class Model {
//    @objc dynamic var name = ["Dao Hung","Dinh Toan","Kim Hoang","Van Kiet","Nam Phu","Hoang Duy"]
//    @objc dynamic var phone = ["0917618518","0919009009","0999888777","0910998998","0977887667","0917665778"]
//    @objc dynamic var avt : [Data] = []
//
//}