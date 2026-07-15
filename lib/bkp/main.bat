import 'package:flutter/material.dart';

void main() {
  runApp(const LazyDogsBusApp());
}

// Cores personalizadas
const Color kPrimaryColor = Color(0xFFB07A4A); // Um tom de marrom/caramelo
const Color kAccentColor = Color(0xFFE9D2B5); // Um bege areia claro
const Color kTextColor = Color(0xFF4A3728); // Um marrom escuro para textos
const Color kCardColor = Color(0xFFF3E2C5); // Um bege areia para fundos de cards

class LazyDogsBusApp extends StatelessWidget {
  const LazyDogsBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyDogsBus',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        scaffoldBackgroundColor: kAccentColor, // Fundo geral do app
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor, // Cor da AppBar
          foregroundColor: Colors.white, // Cor do texto e ícones na AppBar
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kTextColor,
          backgroundColor: kCardColor,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Função para mudar a aba selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // As páginas agora recebem a função de navegação para os cards da Home
    final List<Widget> _pages = [
      HomeTab(onNavigate: _onItemTapped), // Passa a função para a HomeTab
      const ViagemTab(),
      const GastosTab(),
      const CadastroTab(),
      const ConfigTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LazyDogsBus'),
        actions: [
          // Exemplo de botão de ação, se precisar no futuro
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notificações')),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Viagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final Function(int) onNavigate;

  const HomeTab({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                // Logo
                Image.asset(
                  'assets/logo.jpeg', // Certifique-se de que o caminho está correto
                  height: 100,
                ),
                const SizedBox(height: 16),
                const Text(
                  'LazyDogsBus',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Controle de viagens, gastos e cadastros em um só lugar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle(title: 'Acessos rápidos'),
          const SizedBox(height: 12),
          _QuickCard(
            title: 'Viagem',
            subtitle: 'Criar, visualizar e acompanhar trajetos',
            icon: Icons.directions_bus,
            onTap: () => onNavigate(1), // Navega para a aba Viagem (índice 1)
          ),
          _QuickCard(
            title: 'Gastos',
            subtitle: 'Lançar e consultar despesas',
            icon: Icons.payments,
            onTap: () => onNavigate(2), // Navega para a aba Gastos (índice 2)
          ),
          _QuickCard(
            title: 'Cadastro',
            subtitle: 'Gerenciar usuários, empresas e clientes',
            icon: Icons.badge,
            onTap: () => onNavigate(3), // Navega para a aba Cadastro (índice 3)
          ),
          _QuickCard(
            title: 'Config',
            subtitle: 'Backup, versão e permissões',
            icon: Icons.settings,
            onTap: () => onNavigate(4), // Navega para a aba Config (índice 4)
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: kCardColor, // Mantém o fundo do card claro para o resumo
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resumo do app',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aqui ficará a visão geral da viagem, com acesso direto às áreas principais.',
                  style: TextStyle(
                    fontSize: 14,
                    color: kTextColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE VIAGEM ---
class ViagemTab extends StatefulWidget {
  const ViagemTab({super.key});

  @override
  State<ViagemTab> createState() => _ViagemTabState();
}

class _ViagemTabState extends State<ViagemTab> {
  final TextEditingController _origemController = TextEditingController();
  final TextEditingController _destinoController = TextEditingController();

  @override
  void dispose() {
    _origemController.dispose();
    _destinoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Planejar Nova Viagem'),
          const SizedBox(height: 12),
          TextField(
            controller: _origemController,
            decoration: InputDecoration(
              labelText: 'Origem',
              hintText: 'Cidade de partida',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _destinoController,
            decoration: InputDecoration(
              labelText: 'Destino',
              hintText: 'Cidade de chegada',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Implementar lógica para "Ver Trajeto"
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Ver Trajeto de ${_origemController.text} para ${_destinoController.text}'),
                  ),
                );
              },
              icon: const Icon(Icons.map),
              label: const Text('Ver Trajeto no Mapa'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Placeholder para o mapa
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Mapa será exibido aqui',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE GASTOS ---
class GastosTab extends StatelessWidget {
  const GastosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Gastos',
      subtitle: 'Controle suas despesas de viagem aqui.',
      icon: Icons.payments,
    );
  }
}

// --- TELA DE CADASTRO ---
class CadastroTab extends StatelessWidget {
  const CadastroTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Cadastro',
      subtitle: 'Gerencie usuários, empresas e clientes.',
      icon: Icons.badge,
    );
  }
}

// --- TELA DE CONFIGURAÇÕES ---
class ConfigTab extends StatelessWidget {
  const ConfigTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Configurações do Aplicativo'),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.public, color: kTextColor),
            title: const Text('Gerenciar Países', style: TextStyle(color: kTextColor)),
            subtitle: const Text('Selecione os países disponíveis para viagens', style: TextStyle(color: kTextColor)),
            trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CountrySelectionScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: kTextColor),
            title: const Text('Sobre o App', style: TextStyle(color: kTextColor)),
            subtitle: const Text('Informações sobre a versão e licenças', style: TextStyle(color: kTextColor)),
            trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Informações do App')),
              );
            },
          ),
          // Adicione mais opções de configuração aqui
        ],
      ),
    );
  }
}

// --- NOVA TELA DE SELEÇÃO DE PAÍSES ---
class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  final List<String> _latinAmericanCountries = [
    'Argentina', 'Bolívia', 'Brasil', 'Chile', 'Colômbia', 'Costa Rica',
    'Cuba', 'Equador', 'El Salvador', 'Guatemala', 'Honduras', 'México',
    'Nicarágua', 'Panamá', 'Paraguai', 'Peru', 'República Dominicana',
    'Uruguai', 'Venezuela',
  ];

  // Mapa para armazenar o estado de seleção de cada país
  final Map<String, bool> _selectedCountries = {};
  bool _selectAllLatinAmerica = false;

  @override
  void initState() {
    super.initState();
    // Inicializa todos os países como não selecionados por padrão
    for (var country in _latinAmericanCountries) {
      _selectedCountries[country] = false;
    }
  }

  void _toggleSelectAllLatinAmerica(bool value) {
    setState(() {
      _selectAllLatinAmerica = value;
      for (var country in _latinAmericanCountries) {
        _selectedCountries[country] = value;
      }
    });
  }

  void _toggleCountry(String country, bool value) {
    setState(() {
      _selectedCountries[country] = value;
      // Se algum país for desmarcado, desmarca "América Latina (todos os países)"
      if (!value) {
        _selectAllLatinAmerica = false;
      } else {
        // Se todos os países estiverem marcados, marca "América Latina (todos os países)"
        _selectAllLatinAmerica = _latinAmericanCountries.every((c) => _selectedCountries[c] == true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Países'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(title: 'Países Disponíveis'),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('América Latina (todos os países)', style: TextStyle(color: kTextColor)),
              value: _selectAllLatinAmerica,
              onChanged: _toggleSelectAllLatinAmerica,
              activeColor: kPrimaryColor,
            ),
            const Divider(),
            ..._latinAmericanCountries.map((country) {
              return SwitchListTile(
                title: Text(country, style: const TextStyle(color: kTextColor)),
                value: _selectedCountries[country] ?? false,
                onChanged: (value) => _toggleCountry(country, value),
                activeColor: kPrimaryColor,
              );
            }).toList(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Salvar as seleções e retornar para a tela anterior
                  // Por enquanto, apenas volta
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configurações de países salvas (temporariamente)')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Salvar Seleção'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGETS AUXILIARES ---
class _SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SimplePage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE9D2B5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 42, color: kPrimaryColor),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: kTextColor,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap; // Adiciona um callback para o clique

  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Usa GestureDetector para detectar o toque
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kTextColor, // Fundo do card preto
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF4A3728)), // Borda escura
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: kPrimaryColor, // Fundo do ícone
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: 28), // Ícone branco e maior
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white, // Título branco
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.8), // Subtítulo branco mais suave
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: kTextColor,
      ),
    );
  }
}