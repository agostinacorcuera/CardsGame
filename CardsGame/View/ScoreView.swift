struct ScoreView: View {
    let title: String
    let score: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            Text("\(score)")
                .font(.largeTitle)
        }
    }
}