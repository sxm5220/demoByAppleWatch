//
//  LanguageView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct LanguageView: View {
    // Variables
    @State private var selected = "English (United States)"
    let options = ["Arabic", "Chinese (Cantonese - China mainland)", "Chinese (Cantonese - Hong Kong)", "Chinese (Mandarin - China mainland)", "Chinese (Mandarin - Taiwan)", "Danish", "Dutch (Belgium)", "Dutch (Netherlands)", "English (Australia)", "English (Canada)", "English (India)", "English (Ireland)", "English (New Zealand)", "English (Singapore)", "English (South Africa)", "English (United Kingdom)", "English (United States)", "Finnish", "French (Belgium)", "French (Canada)", "French (France)", "French (Switzerland)", "German (Austria)", "German (Germany)", "German (Switzerland)", "Hebrew", "Italian (Italy)", "Italian (Switzerland)", "Japanese", "Korean", "Malay", "Norwegian Bokmål", "Portuguese (Brazil)", "Russian", "Spanish (Chile)", "Spanish (Mexico)", "Spanish (Spain)", "Spanish (United States)", "Swedish", "Thai", "Turkish"]
    
    var body: some View {
        List {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selected = option
                }, label: {
                    HStack {
                        Text(option)
                        if selected == option {
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }
                    }
                })
            }
        }
        .navigationTitle("Language")
    }
}

#Preview {
    NavigationStack{
        LanguageView()
    }
}
