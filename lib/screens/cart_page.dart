import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final List<Map<String, dynamic>> itensCarrinho = const [
    {'nome': 'Mouse Gamer', 'preco': 149.99, 'quantidade': 1},
    {'nome': 'Teclado Mecânico', 'preco': 349.90, 'quantidade': 1},
  ];

  double get total => itensCarrinho.fold(0, (soma, item) => soma + (item['preco'] * item['quantidade']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Carrinho'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight + 16),
            Expanded(
              child: ListView.builder(
                itemCount: itensCarrinho.length,
                itemBuilder: (context, index) {
                  final item = itensCarrinho[index];
                  return ListTile(
                    title: Text(item['nome'], style: const TextStyle(color: Colors.white)),
                    subtitle: Text('R\$ ${item['preco'].toStringAsFixed(2)}', style: const TextStyle(color: Colors.white70)),
                    trailing: Text('x${item['quantidade']}', style: const TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 18, color: Colors.white)),
                      Text('R\$ ${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/checkout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8A4DFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Finalizar compra',style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}