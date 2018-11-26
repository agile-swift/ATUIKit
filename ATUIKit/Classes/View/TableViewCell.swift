//
//  TableViewCell.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/14.
//
//

import UIKit

open class TableViewCell: UITableViewCell {
    
    public weak var tableView : UITableView?
    
    open class func cellWithTableView(_ tableView:UITableView, withReuseIdentifier identifier: String? = nil,bindData:Any?) -> TableViewCell {
        var identifier = identifier
        if identifier == nil {
            identifier = NSStringFromClass(self) as String
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier!)
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: identifier)
            (cell as? TableViewCell)?.tableView = tableView
        }
        (cell as! TableViewCell).bindData(bindData)
        
        return cell as! TableViewCell
    }
    
    open class func height(_ data:Any? = nil) -> CGFloat {
        return 44.fit6
    }
    
    required public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func bindData(_ data:Any?) {
        fatalError("bindData(_:) has not been implemented")
    }
    
    open func setupView() {
        fatalError("setupView() has not been implemented")
    }
}
