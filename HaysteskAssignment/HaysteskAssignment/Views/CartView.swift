import SwiftUI
struct CartView: View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var selectedProducts: Set<Int> = []
    @State private var showThankYou = false
    
    var totalPrice: Double {
        viewModel.cart
            .filter { selectedProducts.contains($0.id) }
            .reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Title
                HStack {
                    Text("Cart")
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top)
                
                AddressBarView()
                SelectAllView(
                    allSelected: selectedProducts.count == viewModel.cart.count,
                    toggleAll: toggleAllSelection
                )
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.cart) { product in
                            CartItemRow(
                                product: product,
                                isSelected: selectedProducts.contains(product.id),
                                toggleSelection: { toggleSelection(for: product.id) },
                                increase: { viewModel.increaseQuantity(product) },
                                decrease: { viewModel.decreaseQuantity(product) },
                                quantity: viewModel.quantity(for: product)
                            )
                        }
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 120) // space for checkout bar
                }
            }
            .background(Color(.systemGray6))
            
            // ✅ Checkout bar
            if !viewModel.cart.isEmpty {
                CheckoutBar(totalPrice: totalPrice) {
                    showThankYou = true
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            selectedProducts = Set(viewModel.cart.map { $0.id })
        }
        // ✅ Thank you popup — clears cart on OK
        .alert("✅ Thank You!", isPresented: $showThankYou) {
            Button("OK", role: .cancel) {
                viewModel.cart.removeAll()
                selectedProducts.removeAll()
            }
        } message: {
            Text("Your order has been placed successfully.")
        }
    }
    
    // MARK: - Selection Logic
    private func toggleAllSelection() {
        if selectedProducts.count == viewModel.cart.count {
            selectedProducts.removeAll()
        } else {
            selectedProducts = Set(viewModel.cart.map { $0.id })
        }
    }
    
    private func toggleSelection(for id: Int) {
        if selectedProducts.contains(id) {
            selectedProducts.remove(id)
        } else {
            selectedProducts.insert(id)
        }
    }
}
