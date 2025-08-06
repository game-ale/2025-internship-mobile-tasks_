Implement BLoC
Implement ProductBloc to manage product-related business logic in the Ecommerce app using the BLoC pattern and TDD.

📌 ***Requirements***
 Event Classes
LoadAllProductEvent

GetSingleProductEvent

UpdateProductEvent

DeleteProductEvent

CreateProductEvent

***State Classes***
InitialState

LoadingState

LoadedAllProductState

LoadedSingleProductState

ErrorState

 ***ProductBloc***
Set initial state.

Handle all events with mapEventToState.

Interact with use cases (get, create, update, delete).

Emit states via streams.

Implement proper error handling.

Write unit tests for events, states, and bloc logic.