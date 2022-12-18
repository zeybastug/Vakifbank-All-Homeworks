//
//  CoreDataSulo.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 3.12.2022.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveNote(text: String, episode:String, season:String) -> Notes? {
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        note.setValue(text, forKeyPath: "noteText")
        note.setValue(episode, forKeyPath: "episode")
        note.setValue(season, forKeyPath: "season")
        
        do {
            try managedContext.save()
            return note as? Notes
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    func getNotes() -> [Notes] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Notes")
        do {
            let notes = try managedContext.fetch(fetchRequest)
            return notes as! [Notes]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
}

