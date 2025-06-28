import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Meu Perfil'),
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
        child: ListView(
          padding: const EdgeInsets.only(top: kToolbarHeight + 16),
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Center(child: Text('Usuário Teste', style: TextStyle(fontSize: 20, color: Colors.white))),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text('Histórico de pedidos', style: TextStyle(color: Colors.white)),
              subtitle: Text('Você ainda não fez nenhum pedido.', style: TextStyle(color: Colors.white70)),
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Sair', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false),
            ),
          ],
        ),
      ),
    );
  }
}
