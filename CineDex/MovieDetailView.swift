import SwiftUI

struct MovieDetailView: View {
  @StateObject var viewModel: MovieDetailViewModel
  
  init(movie: Movie) {
    _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movie: movie))
  }
  
  var body: some View {
    List {
      VStack {
        Text(viewModel.movie.metadata?.originalTitle ?? "Unknown Title")
          .font(.title)
          .padding()
        
        Text(viewModel.formattedYear)
          .font(.headline)
          .padding()
        
        Text(viewModel.movie.metadata?.summary ?? "No summary available.")
          .font(.body)
          .padding()
        
        // Add more details as needed
        
        Spacer()
      }
      .navigationBarTitle(viewModel.movie.metadata?.originalTitle ?? "Movie Detail", displayMode: .inline)
    }
  }
}

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    // You can create a sample Movie object for preview
    let sampleMovie = Movie(context: PersistenceController.preview.container.viewContext)
    sampleMovie.metadata = Metadata(context: PersistenceController.preview.container.viewContext)
    sampleMovie.metadata?.originalTitle = "Sample Movie"
    sampleMovie.metadata?.year = 2022
    sampleMovie.metadata?.summary = "This is a sample movie summary."
    
    return NavigationView {
      MovieDetailView(movie: sampleMovie)
    }
  }
}