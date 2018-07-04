//
//  DataService.swift
//  DemoCoreDataRegister
//
//  Created by Đừng xóa on 7/3/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import Foundation

class DataService {
    static var shared: DataService = DataService()
    
    private var _students:[Student]?
    var student:[Student] {
        get {
            if _students == nil {
                loadDataStudent()
            }
            return _students ?? []
        }
        set {
            _students = newValue
        }
    }
    private func loadDataStudent() {
        _students = []
        do {
            _students = try AppDelegate.context.fetch(Student.fetchRequest()) as? [Student]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    func saveData() {
        AppDelegate.saveContext()
        loadDataStudent()
    }
    
    func deleteData(from indexPath: IndexPath) {
        guard let object = _students else { return }
        AppDelegate.context.delete(object[indexPath.row])
        saveData()
    }
}
