import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Finalizar Compra'),
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight + 16),
            const Text('Endereço de Entrega', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Rua, número, bairro',
                filled: true,
                fillColor: Colors.white10,
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text('Forma de Pagamento', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              dropdownColor: Colors.grey[900],
              iconEnabledColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                hintText: 'Selecione o método',
                hintStyle: TextStyle(color: Colors.white54),
              ),
              items: const [
                DropdownMenuItem(value: 'pix', child: Text('Pix')),
                DropdownMenuItem(value: 'boleto', child: Text('Boleto')),
                DropdownMenuItem(value: 'cartao', child: Text('Cartão de Crédito')),
              ],
              onChanged: (value) {},
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: Colors.grey[900],
                      title: const Text('Compra realizada!', style: TextStyle(color: Colors.white)),
                      content: const Text('Seu pedido foi confirmado com sucesso.', style: TextStyle(color: Colors.white70)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, '/products', (route) => false),
                          child: const Text('OK', style: TextStyle(color: Colors.amberAccent)),
                        )
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8A4DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Confirmar pedido', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
