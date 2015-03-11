//
//  PromptProviderViewModel.swift
//  ChangeUp
//
//  Created by Alex on 9/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

class PromptProviderViewModel: NSObject {
    
    var searchViewModel: SearchViewModel?
    
    var selectedProvider: String!
    
    private var providers: [Provider]!
    
    override init() {
        super.init()
        self.providers = []
    }
    
    func getProviders() -> [Provider] {
        return self.providers
    }
}