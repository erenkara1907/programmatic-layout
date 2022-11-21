//
//  RickyMortyViewModel.swift
//  ProgrammaticLayoutProject
//
//  Created by Eren Kara on 21.11.2022.
//

import Foundation

protocol IRickyMortyViewModel {
    func fetchItem()
    func changeLoading()
    
    var rickyMortyCharacters: [Result] { get set }
    var rickyMortyService: IRickyMortyService { get }
    
    var rickyMortyOutput: IRickyMortyViewController? { get }
    
    func setDelegate(output: IRickyMortyViewController)
}

final class RickyMortyViewModel: IRickyMortyViewModel {
    var rickyMortyOutput: IRickyMortyViewController?
    
    func setDelegate(output: IRickyMortyViewController) {
        rickyMortyOutput = output
    }
    
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    private var isLoading = false
    
    var rickyMortyCharacters: [Result] = []
    var rickyMortyService: IRickyMortyService = RickyMortyService()
    
    func fetchItem() {
        changeLoading()
        rickyMortyService.fetchAllData { [weak self] (response) in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
            self?.rickyMortyOutput?.saveData(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyOutput?.changeLoading(isLoad: isLoading)
    }
}
