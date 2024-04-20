import SwiftUI

struct PracticeQuestion: Codable, Identifiable {
    let question: String
    let answer: String
    let options: [Option]
    var id: String { question }
    
    struct Option: Codable, Identifiable {
        let option: String
        let id: String  // Use 'id' from JSON as Swift's 'Identifiable' identifier
    }
}


class PracticeQuestionAPI {
    static let baseUrl = "https://shibal.online/get-questions?unit="

    static func fetchQuestions(unit: String, completion: @escaping (Result<[PracticeQuestion], Error>) -> Void) {
        guard let url = URL(string: baseUrl + unit) else {
            completion(.failure(NSError(domain: "", code: -1000, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                }
                return
            }
            
            do {
                let questions = try JSONDecoder().decode([PracticeQuestion].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(questions))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

struct PracticeSelectionView: View {
    let units = [
        "unit1": "Introduction to the Stock Market",
        "unit2": "Basics of Investing",
        "unit3": "Introduction to Fundamental Analysis",
        "unit4": "Evaluating Company Financials: Income Statements",
        "unit5": "Evaluating Company Financials: Balance Sheet",
        "unit6": "Evaluating Company Financials: Cash Flow Statement",
        "unit7": "Understanding Financial Ratios and Company Advantages",
        "unit8": "Understanding Stock Quotes"
        // Add more units as needed
    ]

    
    var body: some View {
        NavigationStack {
            Text("Practice")
                .font(.title)
                .bold()
                .padding(.all)
            List(units.keys.sorted(), id: \.self) { unitId in
                NavigationLink(destination: PracticeView(unit: unitId)) {
                    HStack {
                        Image(systemName: "photo") // Using a system image as a placeholder
                            .resizable() // Allow the image to be resized
                            .frame(width: 70, height: 70) // Square image with specific height
                            .background(Color.gray) // Optional: Adds a background color to distinguish the placeholder
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners

                        Text(units[unitId] ?? "")
                            .bold()
                            .font(.title3)
                            .padding(.vertical)
                    }
                }
            }
        }
    }


}

struct PracticeView: View {
    let unit: String
    @State private var questions: [PracticeQuestion] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var score = 0
    @State private var showScore = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else if showScore {
                VStack {
                    Text("Your final score:")
                        .font(.title)
                    Text("\(score)/\(questions.count)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else if currentQuestionIndex < questions.count {
                let question = questions[currentQuestionIndex]
                VStack(alignment: .center, spacing: 20) {
                    Text(question.question)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    ForEach(question.options) { option in
                        Button(action: {
                            selectedAnswer = option.id
                        }) {
                            Text(option.option)
                                .font(.body)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedAnswer == option.id ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    Button(action: {
                        if selectedAnswer == question.answer {
                            score += 1
                        }
                        selectedAnswer = nil
                        if currentQuestionIndex < questions.count - 1 {
                            currentQuestionIndex += 1
                        } else {
                            showScore = true
                        }
                    }) {
                        Text("Submit")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(selectedAnswer == nil)
                }
                .padding()
            }
        }
        .navigationTitle("Practice")
        .onAppear {
            loadQuestions()
        }
    }
    
    private func loadQuestions() {
        isLoading = true
        errorMessage = nil
        
        PracticeQuestionAPI.fetchQuestions(unit: unit) { result in
            isLoading = false
            switch result {
            case .success(let questions):
                self.questions = questions
            case .failure(let error):
                self.errorMessage = "Could not load questions: \(error.localizedDescription)"
            }
        }
    }
}


struct MainMenuViewPreview1: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
