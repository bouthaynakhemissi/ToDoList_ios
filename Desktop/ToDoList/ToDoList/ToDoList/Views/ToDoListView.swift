import SwiftUICore
import SwiftUI
import FirebaseFirestore
struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListitem]
    @State private var selectedItem: ToDoListitem
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        self.selectedItem = .init(id: "", title: "", dueDate: Date().timeIntervalSince1970, CreatedDate: Date().timeIntervalSince1970, isDone: true)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                //fetchTodoItems()
          //  }

            // Fetch to-do items from Firestore and/or API
           // func fetchTodoItems() {
                // Fetch from Firebase or use API (or both)
               // fetchFromAPI()
          //  }

          //  private func fetchFromAPI() {
                //let apiUrl = "https://task-manager-api3.p.rapidapi.com/3tHcSthvj4mjh3CtpnkJ" // Update this with your actual endpoint

              //  APIService.shared.fetchData(from: apiUrl) { [weak self] result in
                    //switch result {
                  //  case .success(let data):
                        // You can decode the response into your model here
                    //    if let todoItems = try? JSONDecoder().decode([ToDoListitem].self, from: data) {
                          //  DispatchQueue.main.async {
                              //  self?.items = todoItems
                          //  }
                   //     } else {
                       //     DispatchQueue.main.async {
                           //     self?.errorMessage = "Failed to decode response"
                      //      }
                    //    }

                //    case .failure(let error):
                 //       DispatchQueue.main.async {
                      //      self?.errorMessage = error.localizedDescription
              

            
                
                List(viewModel.items, id: \.id) { item in
                    ToDoListitemView(item: item)
                        .swipeActions {
                            Button {
                                // Delete
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                            
                            Button {
                                // EDIT
                                selectedItem = item
                                viewModel.showingEditItemView = true
                            } label: {
                                Text("Edit")
                            }
                            .tint(.gray)
                        }
                        .sheet(isPresented: $viewModel.showingEditItemView) {
                            EditItemView(newItemPresented: $viewModel.showingEditItemView, item: selectedItem)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "3ANZuyqZH6PwcPCFVQoK7Xq2Jyz2")
    }
}
