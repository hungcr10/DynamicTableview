//
//  Model.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 30/12/2021.
//

import Foundation
import UIKit

struct Contact {
     var name: String
     var phone: String
     var avt: String
        var imageCovert: UIImage! {
        return UIImage(named: avt)
    }
}
var contactDatasources: [Contact] = [  Contact(name: "Dao Hung", phone: "0917618517", avt: "hung"),
                                               Contact(name: "Pham Toan", phone: "0917618517", avt: "toan"),
                                               Contact(name: "Nam Phu", phone: "0917618517", avt: "kiet"),
                                               Contact(name: "Van Kiet", phone: "0917618517", avt: "phu"),
                                               Contact(name: "Anh Pham", phone: "0917618517", avt: "hoang"),
                                               Contact(name: "Anh Tran", phone: "0917618517", avt: "kiet"),
                                               Contact(name: "Bao Nam", phone: "0917618517", avt: "hung"),
                                               Contact(name: "Bao Tin", phone: "0917618517", avt: "toan"),
                                               Contact(name: "Giao Thuy", phone: "0917618517", avt: "phu"),
                                               Contact(name: "Kha Le", phone: "0917618517", avt: "hoang"),
                                               Contact(name: "Le Tin", phone: "0917618517", avt: "hung"),
                                               Contact(name: "Nam Nguyen", phone: "0917618517", avt: "phu"),
                                               Contact(name: "Mai Ho", phone: "0917618517", avt: "duy")]
//class Model {
//    @objc dynamic var name = ["Dao Hung","Dinh Toan","Kim Hoang","Van Kiet","Nam Phu","Hoang Duy"]
//    @objc dynamic var phone = ["0917618518","0919009009","0999888777","0910998998","0977887667","0917665778"]
//    @objc dynamic var avt : [Data] = []
//
//}
