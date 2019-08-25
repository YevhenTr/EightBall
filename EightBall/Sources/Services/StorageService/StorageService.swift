//
//  StorageService.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation
import CoreData

class StorageService {
    
    // MARK: - Subtypes
    
    // MARK: - Properties
    
    func isContain(answer: String) -> Bool {
        let request = self.requestToFind(answer: answer)
        
        return (try? self.context.fetch(request))?
            .compactMap { $0 }
            .first
            .isSome ?? false
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CDAnswerModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext { return self.persistentContainer.viewContext }
    
    // MARK: - Public API
        
    func add(answer: String) {
        if !self.isContain(answer: answer) {
            let _ = answer.asCDAnswerModel(context: self.context)
            self.saveContext()
        }
    }
    
    func randomAnswer() -> String {
        return self.allAnswers().randomElement() ?? ""
    }
    
    func allAnswers() -> [String] {
        let request: NSFetchRequest<CDAnswerModel> = CDAnswerModel.fetchRequest()
        
        return (try? self.context.fetch(request))?
            .compactMap { $0.answer } ?? []
    }
    
    func delete(answer: String) {
        let request = self.requestToFind(answer: answer)
        
        (try? self.context.fetch(request))?
            .first
            .map { self.context.delete($0) }
        self.saveContext()
    }
    
    // MARK: - Private API
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            try? context.save()
        }
    }
    
    private func requestToFind(answer: String) -> NSFetchRequest<CDAnswerModel> {
        let request: NSFetchRequest<CDAnswerModel> = CDAnswerModel.fetchRequest()
        
        request.predicate = NSPredicate(format: "answer == %@", answer)
        
        return request
    }
}

extension String {
    
    func asCDAnswerModel(context: NSManagedObjectContext) -> CDAnswerModel {
        let managedObject = CDAnswerModel(context: context)
        
        managedObject.answer = self
        
        return managedObject
    }
}
