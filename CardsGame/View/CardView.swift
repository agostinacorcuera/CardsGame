
struct CardView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(15)
            .frame(width: 150, height: 280)
    }
}