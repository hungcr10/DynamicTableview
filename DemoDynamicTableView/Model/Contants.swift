//
//  File.swift
//  DemoDynamicTableView
//
//  Created by CristianoDaoHung on 02/01/2022.
//

import Foundation
struct Contants {
    static let identifier = "HomeTableCell"
    static let nibName = "HomeTableViewCell"
    static var contactDatasources: [Contacts] = [Contacts(name: "Dao Hung", phone: "092828", avt: #imageLiteral(resourceName: "hung")),
                                                Contacts(name: "Nam Phu", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contacts(name: "Van Kiet", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contacts(name: "Anh Pham", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Anh Tran", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Bao Nam", phone: "0917618517", avt: #imageLiteral(resourceName: "toan")),
                                                Contacts(name: "Bao Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contacts(name: "Giao Thuy", phone: "0917618517", avt: #imageLiteral(resourceName: "phu")),
                                                Contacts(name: "Kha Le", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang")),
                                                Contacts(name: "Le Tin", phone: "0917618517", avt: #imageLiteral(resourceName: "duy")),
                                                Contacts(name: "Nam Nguyen", phone: "0917618517", avt: #imageLiteral(resourceName: "kiet")),
                                                Contacts(name: "Mai Ho", phone: "0917618517", avt: #imageLiteral(resourceName: "hoang"))]
}
struct CellActionImage {
    static let pinImg = "pin.fill"
    static let favoriteImg = "star.fill"
    static let trashImg = "trash.fill"
    static let messageImg = "message.fill"
    static let videoCallImg = "video.fill"
    static let moreImg = "ellipsis"
}
