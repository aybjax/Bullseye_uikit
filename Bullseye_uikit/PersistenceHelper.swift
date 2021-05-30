//
//  PersistenceHelper.swift
//  Bullseye_uikit
//
//  Created by aybjax on 5/31/21.
//

import Foundation

class PersistencyHelper {
    static func saveHighScores( _ items: [HighScoreItem]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        }
        catch {
            print("error \(error.localizedDescription)")
        }
    }
    
    static func loadHighScores() -> [HighScoreItem] {
        var items = [HighScoreItem]()
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([HighScoreItem].self, from: data)
            }
            catch {
                print("error \(error.localizedDescription)")
            }
        }
        
        return items
    }
    
    static func dataFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("path is \(paths[0])")
        
        return paths[0].appendingPathComponent("Highscores.plist")
    }
}
