//
//  CoreDataManger.swift
//  HelloCoreData
//
//  Created by Tilek on 5/12/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistantContainer: NSPersistentContainer
    init(){
        persistantContainer = NSPersistentContainer(name:"Model")
        persistantContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func updateMovie(){
        do{
            try persistantContainer.viewContext.save()
        }
        catch{
            persistantContainer.viewContext.rollback()
        }
    }
    
    
    func deleteMovie(movie: Movie){
        persistantContainer.viewContext.delete(movie)
        
        do{
            try persistantContainer.viewContext.save()
        }
        catch{
            persistantContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
    }
    
    func getAllMovies() -> [Movie]{
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()

        do{
           return try persistantContainer.viewContext.fetch(fetchRequest)
        }
        catch {
            return []
        }
    }
    func saveMovie(title: String){
        let movie = Movie(context: persistantContainer.viewContext)
        movie.title = title
        
        do {
            try persistantContainer.viewContext.save()
            print("Movie saved!")
        } catch{
            print("Failed to save movie \(error)")
        }
    }
}
